"use strict";
// import express to use it
const express = require("express");
// Instantiate express and assign it to a variable named 'app'
const app = express();

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
    console.log("La connexion à la base de données est bien établie.");
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

// Specify the port number on which the server will listen for incoming requests
const PORT = 8080;
app.listen(PORT, () => {
  // Log a message indicating that the server is listening on the specified port
  console.log(`server is listening to Port ${PORT}`);
});
