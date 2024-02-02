"use strict";

// Define the Notifications Class
class Notification {
  #id; // Private field for notifications ID

  // Constructor for initializing a new Notification instance
  constructor(id, message, date) {
    (this.#id = id), (this.message = message), (this.date = date);
  }

  // Placeholder  method to send a notification to a user
  sendNotification(user) {
    // Display the notification information in the console
    // In a real application, this would be where you integrate with an email/SMS service
    console.log(
      `Notification for ${user.email}: ${this.message} on ${this.date}`
    );
  }
}

// Define the NotificationManager class
class NotificationManager {
  constructor() {
    this.notificationIdCounter = 0; // Counter to generate unique notification IDs
  }

  // Method to send delayed notifications
  sendDelayNotification(user, message) {
    const today = new Date().toISOString().split("T")[0]; // Get current date as YYYY-MM-DD

    // Create a new Notification instance with a unique ID, message, and today's date
    let notification = new Notification(
      this.notificationIdCounter++,
      message,
      today
    );
    // Send the notification
    notification.sendNotification(user);
  }

  // Method to send order tracking notifications
  trackOrder(user, orderId, status) {
    const message = `Order ${orderId} is now ${status}.`; // Create a message for the notification
    const date = new Date().toISOString().split("T")[0];

    // Create a new Notification instance with a unique ID, the order message, and date
    let notification = new Notification(
      this.notificationIdCounter++,
      message,
      date
    );
    notification.sendNotification(user);
  }
}
