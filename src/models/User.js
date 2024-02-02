"use strict";

// create a user class
class User {
  // create a private attribute
  #id;
  #password;

  // Constructor for initializing a new User instance
  constructor(id, firstName, lastName, password, email) {
    (this.#id = id),
      (this.firstName = firstName),
      (this.lastName = lastName),
      (this.#password = password),
      (this.email = email),
      (this.isEmailVerified = false);
  }

  // Method to authenticate the user using their password

  authenticate(inputPassword) {
    return inputPassword === this.#password;
  }

  // Placeholder method to delete a user account
  deletAccount() {
    console.log(`User ${this.#id} account deleted.`);
  }

  // Placeholder method for user login
  logIn() {
    console.log(`User ${this.firstName} logged in.`);
  }

  // Placeholder method for user logout
  logOut() {
    console.log(`User ${this.firstName} logged out.`);
  }
}

// Define the AccountManager class
class AccountManager {
  constructor() {
    this.users = {}; // Initialize an object to store users
  }

  // check if user name already exists or not

  // Method to create a new user account
  createUser(id, firstName, lastName, password, email) {
    if (this.users[id]) {
      console.log("Username already exists.");
      return;
    }
    // Create a new User instance and add it to the users object
    const newUser = new User(id, firstName, lastName, password, email);
    this.users[id] = newUser;

    // Send a verification email to the new user
    this.sendVerificationEmail(newUser);
  }

  // Method to send a verification email to the user
  sendVerificationEmail(user) {
    console.log(`Verification email sent to ${user.email}`);
  }
}
