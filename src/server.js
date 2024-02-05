"use strict";
// import express to use it
const express = require("express");
// Instantiate express and assign it to a variable named 'app'
const app = express();

const cors = require("cors");
app.use(cors());

// Import body-parser to process POST data
const bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.post("/recuperer-donnees", (req, res) => {
  try {
    const { model, color } = req.body;

    console.log("Données récupérées du frontend:", {
      model,
      color,
    });

    res.json({ message: "Données reçues avec succès" });
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

// First route for the home page
app.get("/", (req, res) => {
  // Respond with the message "hello world" when accessing the home page
  res.send("hello world");
});

// Import the 'db' module, presumably for database connection and queries
const db = require("./db");

// Second route to retrieve users from database
app.get("/users", async (req, res) => {
  try {
    console.log("La connexion à la base de données Users est bien établie.");
    // Execute a SQL query to retrieve all users from the 'users' table
    const result = await db.query("SELECT * FROM users");
    // Respond with the retrieved users in JSON format
    res.json(result.rows);
  } catch (err) {
    // Log any errors that occur during the database query
    console.error(err);
    // Respond with a 500 Internal Server Error if an error occurs
    res.status(500).send("Internal Server Error");
  }
});

// Third route to retrieve Notifications from database
app.get("/Notifications", async (req, res) => {
  try {
    console.log(
      "La connexion à la base de données Notifications est bien établie."
    );
    const result = await db.query("SELECT * FROM Notifications");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

// Fourth route to retrieve Vehicle from database
app.get("/Vehicle", async (req, res) => {
  try {
    console.log("La connexion à la base de données Vehicle est bien établie.");
    const result = await db.query("SElECT * FROM vehicle");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

// Fifth route to retrieve Reservation from database
app.get("/Reservation", async (req, res) => {
  try {
    console.log(
      "La connexion à la base de données Reservation est bien établie."
    );
    const result = await db.query("SElECT * FROM Reservation");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

// Sixth route to retrieve VehicleOption from database
app.get("/VehicleOption", async (req, res) => {
  try {
    console.log(
      "La connexion à la base de données VehicleOption est bien établie."
    );
    const result = await db.query("SElECT * FROM VehicleOption");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

// Seventh route to retrieve VehicleColor from database
app.get("/VehicleColor", async (req, res) => {
  try {
    console.log(
      "La connexion à la base de données VehicleColor est bien établie."
    );
    const result = await db.query("SElECT * FROM VehicleColor");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

// Specify the port number on which the server will listen for incoming requests
const PORT = 8080;
app.listen(PORT, () => {
  // Log a message indicating that the server is listening on the specified port
  console.log(`server is listening to Port ${PORT}`);
});
