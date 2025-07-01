#!/bin/bash

# Mensaje de bienvenida
echo "¡Bienvenido al script de parametros especiales!"

# Salto de linea
echo ""

# Input para seleccionar el parametro especial
read -p "Porfavor introduce alguno de los siguientes simbolos en la lista y te guiaré en su uso [0, $, !, #, ?, *, @]: " simbolo

# Confirmación de selección
echo "Seleccionaste: $simbolo"

# Salto de linea 
echo ""

case $simbolo in # Cada caso es escapado en el caracter para evitar que los parametros especiales realicen funciones en el codigo inesperadas

    \0)
        echo "El parametro especial "0" Nos retorna el nombre del script tal como es invocado"

        echo ""

        echo "Por ejemplo sí en un script colocas una línea como la siguiente: echo \"Nombre del script: \$0\"" #Escapando caracteres para poder mostrar $0 

        echo ""

        echo "Te devolverá simplemente el nombre del script, en la siguiente linea estoy usando el echo que te mostré en el ejemplo:"

        echo ""
        
        echo "Nombre del script: $0"

        ;;

    \$)
        echo "El parametro especial "$" nos retorna el PID del shell que ejecuta el script"

        echo ""

        echo "Por ejemplo sí en un script colocas una línea como la siguiente: echo \"Número de PID del script: \$$\"" #Escapando caracteres para poder mostrar $$

        echo ""

        echo "Te devolverá el número del proceso del shell que está ejecutando el script, en la siguiente linea estoy usando el echo que te mostré en el ejemplo:"
        
        echo ""
        
        echo "Número de PID del script: $$"

        ;;

    \!)
        echo "El parametro especial "!" nos retorna el PID del ultimo proceso ejecutado en segundo plano"

        echo ""

        echo "Primero necesitamos ejecutar un proceso en segundo plano, podemos colocar una linea de codigo como la siguiente para que nuestro argumento funcione: sleep 10 &"

        #Ejecutando proceso en segundo plano un simple sleep nos servirá de ejemplo para que $! pueda retornar un valor
        sleep 10 &

        echo "Por ejemplo sí en un script colocas una linea como la siguiente: echo \"Número de PID del comando sleep 10 & ejecutado en segundo plano: \$!\"" 

        echo ""

        echo "Te devolverá el PID del último proceso ejecutado en segundo plano que en este caso es nuestro sleep, en la siguiente línea estoy usando el echo que te mostré en el ejemplo:"
        
        echo ""

        echo "Número de PID del comando sleep 10 & ejecutado en segundo plano: $!"

        ;;
    
    \#)
        #Sentencia IF para poder comprobar que el script recibio algún argumento antes de seguir
        if [ "$#" -eq 0 ]; then
            echo "Antes de continuar porfavor ejecuta el script con algún argumento, pueden ser palabras, números o lo que tu gustes, la siguiente línea te muestra un ejemplo de como ejecutar este script"
            echo "Ejecuta el script de la siguiente manera: $0 <tu_argumento1> <tu_argumento2> <tu_argumento3>"
            exit 1 # Sale del script con un código de error
        fi

        # Si llegamos aquí, significa que se proporcionó al menos un argumento
        echo "El parametro especial "#" nos retorna el número de argumentos recibidos en el script"

        echo ""

        echo "Es por eso que te eh solicitado que ingreses algun argumento y veas el funcionamiento, colocando una linea como esta: echo \"Número de argumentos pasados al script: \$#\""

        echo ""

        echo "Te devolverá el número de argumentos que ingresaste en el script, en la siguiente línea estoy usando el echo que te mostré en el ejemplo, este valor cambiará dependiendo de cuantos argumentos ingresaste:"

        echo ""

        echo "Número de argumentos pasados al script: $#"

        ;;

    \*)
        #Sentencia IF para poder comprobar que el script recibio algún argumento antes de seguir
        if [ "$#" -eq 0 ]; then
            echo "Antes de continuar porfavor ejecuta el script con algún argumento, pueden ser palabras, números o lo que tu gustes, la siguiente línea te muestra un ejemplo de como ejecutar este script"
            echo "Ejecuta el script de la siguiente manera: $0 <tu_argumento1> <tu_argumento2> <tu_argumento3>"
            exit 1 # Sale del script con un código de error
        fi

        # Si llegamos aquí, significa que se proporcionó al menos un argumento
        echo "El parametro especial "*" nos retorna el conjunto de todos los argumentos recibidos en el script en un solo parametro"

        echo ""

        echo "Es por eso que te eh solicitado que ingreses algun argumento y veas el funcionamiento, colocando una linea como esta: echo \"Conjunto de argumentos pasados al script en un solo parametro: \$*\""

        echo ""

        echo "Te devolverá el conjunto de argumentos que ingresaste en el script, en la siguiente línea estoy usando el echo que te mostré en el ejemplo:"

        echo ""

        echo "Conjunto de argumentos pasados al script: $*"

        ;;

    \@)
        #Sentencia IF para poder comprobar que el script recibio algún argumento antes de seguir
        if [ "$#" -eq 0 ]; then
            echo "Antes de continuar porfavor ejecuta el script con algún argumento, pueden ser palabras, números o lo que tu gustes, la siguiente línea te muestra un ejemplo de como ejecutar este script"
            echo "Ejecuta el script de la siguiente manera: $0 <tu_argumento1> <tu_argumento2> <tu_argumento3>"
            exit 1 # Sale del script con un código de error
        fi

        # Si llegamos aquí, significa que se proporcionó al menos un argumento
        echo "El parametro especial "@" nos retorna el conjunto de todos los argumentos recibidos en el script pero al contrario del parametro especial "*" este nos devuelve uno por uno"

        echo ""

        echo "Es por eso que te eh solicitado que ingreses algun argumento y veas el funcionamiento, colocando una linea como esta: echo \"Conjunto de argumentos pasados al script, un argumento por parametro: \$@\""

        echo ""

        echo "Te devolverá el conjunto de argumentos que ingresaste en el script, en la siguiente línea estoy usando el echo que te mostré en el ejemplo:"

        echo ""

        echo "Conjunto de argumentos pasados al script, un argumento por parametro: $@"

        ;;

    \?)
        echo "El parametro especial "?" nos retornara el codigo de estado del ultimo comando ejecutado"

        echo ""

        read -p "Por ejemplo introduce algun comando: " comando

        echo "A continuación ejecutare tu comando "$comando" y con la siguiente linea mostraré el codigo de estado de ese comando: echo \"Codigo de estado de tu comando: \$?\""

        echo ""

        # Ejecutando el comando introducido por el usuario
        $comando

        echo ""

        echo "Codigo de estado de tu comando: $?"

        ;;

    *)
        echo "El valor que indicaste no es valido, porfavor vuelve a ejecutar el script e introduce alguno de los valores mostrados en la lista"
        exit 0

        ;;
esac

echo ""
echo ""
echo ""
echo ""
echo ""

read -p "Se que puede llegar a ser confuso el uso de cada uno de estos parametros especiales ¿Quieres que te ayude con algunos ejemplos de casos de uso para cada uno? (s/n): " ayuda

#Sentencia IF para validar la respuesta de ayuda del usuario
if [ $ayuda == "s" ]; then
    read -p "De que parametro especial te gustaría saber algún ejemplo, porfavor introduce algun valor de la siguiente lista [0, $, !, #, ?, *, @]: " parametrohelp
    echo "seleccionaste: $parametrohelp"

    case $parametrohelp in # Cada caso es escapado en el caracter para evitar que los parametros especiales realicen funciones en el codigo inesperadas

        \0)
            echo "El parametro especial "0" Nos retorna el nombre del script tal como es invocado"

            echo ""

            echo "Este parametro nos puede ayudar a que la salida de nuestro script sea el nombre de nuestro script y este funcione como parametro para anidarlo con otro script"

            ;;

        \$)
            echo "El parametro especial "$" nos retorna el PID del shell que ejecuta el script"

            echo ""

            echo "Este parametro nos puede ayudar con algun script en donde el manejo de procesos y subprocesos sea muy relevante y querramos llevar un control sobre el consumo de recursos"
            ;;

        \!)
            echo "El parametro especial "!" nos retorna el PID del ultimo proceso ejecutado en segundo plano"

            echo ""

            echo "Este parametro nos puede ayudar a matar sentencias que se queden cicladas en algun script y forzar su cierre para liberar recursos o debuggear el script sin necesidad de detenerlo"

            ;;
        
        \#)
            echo "El parametro especial "#" nos retorna el número de argumentos recibidos en el script"

            echo ""

            echo "Este parametro nos puede ser de utilidad sí estamos ejecutando un script en donde los argumentos ingresados son relevantes y deseamos manejar arrays con ellos"

            ;;

        \*)
            echo "El parametro especial "*" nos retorna el conjunto de todos los argumentos recibidos en el script en un solo parametro"

            echo ""

            echo "Este parametro nos puede ayudar a tomar los argumentos ingresados en nuestro script y trabajar con ellos en conjunto para series de instrucciones"
            ;;

        \@)
            echo "El parametro especial "@" nos retorna el conjunto de todos los argumentos recibidos en el script pero al contrario del parametro especial "*" este nos devuelve uno por uno"

            echo ""

            echo "Este parametro nos puede ayudar a tomar los argumentos ingresados en nuestro script y sí nuestro script manda a llamar otro, poder pasarle a este algunos de los argumentos que el tomó o todos"

            ;;

        \?)
            echo "El parametro especial "?" nos retornara el codigo de estado del ultimo comando ejecutado"

            echo ""

            echo "Este parametro especial nos puede ayudar con el manejo de errores en nuestro script, para evitar que nuestro programa se rompa, es mejor validar el codigo de estado del comando y programar que hacer en caso de cada codigo"

            ;;

        *)
            echo "El valor que indicaste no es valido, porfavor vuelve a ejecutar el script e introduce alguno de los valores mostrados en la lista"

            exit 0
            ;;
    esac

    echo ""

    echo "Fue un placer ayudarte, sí deseas conocer información mas detallada te invito a visitar la documentación oficial de bash"

    echo "https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html"

    exit 0 # Cierra el script
fi

echo "OK fue un gusto, bye :)"

exit 0