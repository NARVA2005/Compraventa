const express = require("express");
const cors = require("cors");
const app=express();
const port = 3000;
const bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(cors());
//Rutas de la app
//Microservicio people

app.use("/",require("./modules/vehiculo"));
app.use("/",require("./modules/users"));
app.listen(port, ()=>{
    console.log(`app on in port:${port}`);
});
