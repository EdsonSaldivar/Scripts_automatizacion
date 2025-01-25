mkdir mi_proyecto
cd mi_proyecto

npm init -y

npm install express

touch app.js

npm install --save-dev nodemon

#Editamos el script en package.json

"scripts": {
  "dev": "nodemon app.js"
}

#Ahora editamos el script app.js y añadimos un script basico:

const express = require('express');
const app = express();
const port = 3000;

// Ruta de ejemplo
app.get('/', (req, res) => {
  res.send('¡Hola, Mundo!');
});

app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});


#Ahora podemos ejecutar el proyecto con:

npm run dev

#Sí todo salió bien podemos crear los directorios basicos para nuestro proyecto en express con:

mkdir router views utils error
