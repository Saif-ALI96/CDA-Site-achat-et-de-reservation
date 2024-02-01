"use strict";
// import express to use it
const express = require("express");
//  Instantiate express to a variable
const app = express();

app.get("/", (req, res) => {
  res.send("hello world, Jihane chinate ");
});
// specify the port number where your server is going to listen.
const PORT = 8080;
app.listen(PORT, () => {
  console.log(`server is listening to Port ${PORT}`);
});
