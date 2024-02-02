"use strict";
// connection to the database

// Import the 'text' property from the 'express' module (although not used in this code)
const { text } = require("express");

// Database connection configuration using the 'pg' library
const { Pool } = require("pg");

// Create a new instance of the PostgreSQL connection pool
const pool = new Pool({
  user: "root",
  password: "root",
  host: "localhost",
  port: 5432,
  database: "Site-de-reserve-achat",
});

// Export an object with a 'query' function, which can be used to execute SQL queries
module.exports = {
  query: (text, params) => pool.query(text, params),
};
