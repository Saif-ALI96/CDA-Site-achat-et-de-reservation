"use strict";
/* eslint-env node, es6 */

// import le paquet express
const express = require("express");

const PORT = 6300;

// créé une application express
const app = express();

// quant on recois des requêtes type get , on va lui dire qu'il l'envoie a la racine d'où le /
app.get("/", (req, res) => {
  // ici, je peux retourner ma page html developpe par nous
  res.send("Hello world"); // c'est un exemple d'affichage

  // const genererPageAccueil = require("/pages/index-get.js");
});

// pour acceder a un serveur on a besoin deux informations , on a besoin l'adresse IP(où situe le serveur) et on a besoin le port aussi (vers quel port on veut rentrer dans l'or)
app.listen(PORT, () => {
  console.log(`Serveur démarrè : http://localhost:${PORT}`);
});

// ici on peut connecter mon serveur avec notre base de donnée
