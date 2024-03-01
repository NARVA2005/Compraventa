/*microservicios para crear el crub de los usuarios de la galaxia*/
const express = require("express");
const users = express.Router();
const cnx = require("./bdata");
const multer = require("multer");
const path = require("path");
const fs=require("fs");
const { error } = require("console");



//configuracion del multer creacion del espacio de almacenamiento en el Servidor
const almacenamiento = multer.diskStorage({
  //es una varibale de multer para configurar el destinatario de destino de la API, recordar cerrar la ruta con el //
  destination:  (req, file, cb)=> {
    cb(null, './uploads/users/')
  },
  //configuracion del nombre del archivo a guardar en el disco duro de la API
  filename:  (req, file, cb)=> {
    cb(null, "users" + '-' + Date.now() + "-" + file.originalname)
  }
})

const upload = multer({ storage: almacenamiento })

/*Desarrollo del CRUD*/
//Consultar
users.get("/users/listing", (req, res) => {
  let sql = "select*from user";
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

users.get("/users/listing/activos", (req, res) => {
  let sql = "select*from user where estado='activo'";
  cnx.query(sql, (error, data) => {
    try {
      res.status(200).send(data);
    } catch (error) {
      console.log(error);
  
    }
  });
});
users.get("/users/listing/inactivo", (req, res) => {
  let sql = "select*from user where estado='inactivo'";
  cnx.query(sql, (error, data) => {
    try {
      res.status(200).send(data);
    } catch (error) {
      console.log(error);
 
    }
  });
});
users.get("/users/listing/BuscarCorreo/:email", (req, res) => {
  let email = req.params.email;
  let sql = "SELECT email FROM user WHERE email = ? ";
  cnx.query(sql, [email], (error, data) => {
      if (error) {
          console.error("Error al buscar el correo electrónico:", error);
          res.status(500).send("Error interno del servidor al buscar el correo electrónico.");
      } else {
          if (data.length > 0) {
              res.status(200).send({ email: true }); // El correo electrónico existe
          } else {
              res.status(200).send({ email: false }); // El correo electrónico no existe
          }
      }
  });
});

//Consultar por ID
users.get("/users/listing/:id", (req, res) => {
  let id = req.params.id;
  let sql = `SELECT * FROM user WHERE id =${id}  ORDER BY lastname`;
  //cnx.query(`SELECT * FROM people WHERE id =${id}  ORDER BY lastname`, (error, data) => {
  cnx.query(sql, (error, data) => {
    try {
      res.status(200).send(data);
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
  
    }
  });
});
users.put("/users/subirimagen/:id",[upload.single("photo")],(req, res) => {
  // Recibir el parámetro ID
  let id = req.params.id;
  
  // Espera que llegue un archivo
  if (!req.file) {
    return res.status(404).send({
      status: "error",
      message: "Debes seleccionar el archivo"
    });
  }

  // Solo las extensiones png, jpg, jpeg
  let archivo = req.file.filename;
  let extension = archivo.split(".").pop().toLowerCase();
  const validExtensions = ["png", "jpg", "jpeg"];
  
  if (!validExtensions.includes(extension)) {
    // Eliminar el archivo si la extensión no es válida
    fs.unlink(req.file.path, (error) => {
      if (error) {
        console.log(error);
      }
      res.status(404).send({
        status: "error",
        message: "El archivo no es PNG, JPG ni JPEG"
      });
    });
  } else {
    // Recibir la imagen a subir
    let photo = req.file.filename;
    
    // Ejecutar la consulta de actualización de la imagen en la base de datos
    cnx.query("UPDATE user SET photo=? WHERE id=?", [photo, id], (error, data) => {
      if (error) {
        console.log(error);
        return res.status(500).send({
          status: "error",
          message: "Error en la actualización de la imagen:",
          detalle: error.message
        });
      }
      
      // Si la actualización fue exitosa, enviar respuesta al cliente
      res.status(200).send({
        status: "ok",
        message: "Actualización exitosa de la imagen"
      });
    });
  }
});

users.get("/users/mostrarimagen/:photo",[upload.single("photo")],(req, res)=>{
  //parametro
  let photo=req.params.photo;
  //ruta
  let ruta="./uploads/users/"+ photo;
  fs.access(ruta,(error)=>{
    if(!error){
      res.sendFile(path.resolve(ruta));
    }else{
      res.status(404).send({
        status:"error",
        message:"No existe la imagen solicitada"
      })
    }
  })
})
//insertar una persona
users.post("/users/create", (req, res) => {
  let frmdata = {
    name: req.body.name,
    lastname: req.body.lastname,
    rank: req.body.rank,
    email: req.body.email,

  };
  cnx.query("insert into user set ?", frmdata, (error, data) => {
    try {
      res.status(200).send("Insercion exitosa!!");
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
    }
  });
});

//Actualizar un rsolo registro por estado
users.put("/users/updateUnoEstado/:id", (req, res) => {
  let id = req.params.id; //parametro
  let frmdata = {
    estado: req.body.estado,
  };
  cnx.query("update user set? where id=?", [frmdata, id], (error, data) => {
    try {
      res.status(200).send("Actualizacion exitosa!!");
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
    }
  });
});
//Actualizar un registro
users.put("/users/update/:id", (req, res) => {
  let id = req.params.id; //parametro
  let frmdata = {
    name: req.body.name,
    lastname: req.body.lastname,
    rank: req.body.rank,
    email: req.body.email,
  
  };
  cnx.query("update user set? where id=?", [frmdata, id], (error, data) => {
    try {
      res.status(200).send("Actualizacion exitosa!!");
    } catch (error) {
      console.log(error);
      throw `hay un error en la consulta${error}`;
    }
  });
});


//Eliminar por ID
users.delete("/users/deleteid/:id", (req, res) => {
  let id = req.params.id;
  let sql = `delete from user where id=${id}`;

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
module.exports = users;
