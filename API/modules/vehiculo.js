/*microservicios para crear el crub de las personas de la galaxia*/
const express = require("express");

const vehiculo = express.Router();
const cnx = require("./bdata");

/*Desarrollo del CRUD*/
//Consultar
vehiculo.get("/vehiculo/listing", (req, res) => {
  let sql =
    "SELECT*from compraventa";
  cnx.query(sql, (error, data) => {
    try {
      res.status(200).send(data);
    } catch (error) {
      console.log(error);
      /*   res.status(404).send({
        id:error.id,
        mensaje:error.message,
    }); */
    }
  });
});


//Consultar por ID
vehiculo.get("/vehiculo/listing/:id", (req, res) => {
  let id = req.params.id;
  let sql = `SELECT* from vehiculo where idVehiculo=${id}`;
  cnx.query(sql, (error, data) => {
    try {
      res.status(200).send(data);
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
      /*   res.status(404).send({
          id:error.id,
          mensaje:error.message,
      }); */
    }
  });
});
//insertar una persona

vehiculo.post("/vehiculo/create", (req, res) => {
  let frmdata = {
    idVehiculo: req.body.idVehiculo,
    descripcion: req.body.descripcion,
    marca: req.body.marca,
    placa: req.body.placa,
    contrato: req.body.contrato,
  };
  cnx.query("insert into compraventa set ?", frmdata, (error, data) => {
    try {
      res.status(200).send("Insercion exitosa!!");
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
    }
  });
});

//Actualizar un registro
vehiculo.put("/people/update/:id", (req, res) => {
  let id = req.params.id; //parametro
  let frmdata = {
    descripcion: req.body.descripcion,
    marca: req.body.marca,
    placa: req.body.placa,
    contrato: req.body.contrato,
  };
  cnx.query("update compraventa set? where idVehiculo=?", [frmdata, id], (error, data) => {
    try {
      res.status(200).send("Actualizacion exitosa!!");
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
    }
  });
});

//Eliminar por ID
vehiculo.delete("/vehiculo/deleteid/:id", (req, res) => {
  let id = req.params.id;
  let sql = `delete from vehiculo where idVehiculo=${id}`;

  cnx.query(sql, (error, data) => {
    try {
      res.status(200).send("borrado exitoso");
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
      /*   res.status(404).send({
            id:error.id,
            mensaje:error.message,
        }); */
    }
  });
});
module.exports = vehiculo;
