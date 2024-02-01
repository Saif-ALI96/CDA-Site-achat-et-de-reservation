"use strict";

// Define the Reservation class
class Reservation {
  #id; // Private field for reservation ID

  constructor(id, status, customerName, date, vehicle) {
    (this.#id = id),
      (this.status = status),
      (this.customerName = customerName),
      (this.date = date),
      (this.vehicle = vehicle),
      (this.isConfirmed = false),
      (this.isPaid = false);
  }

  // Getter method to access the private ID field
  getId() {
    return this.#id;
  }

  // Implement the makeReservation and cancel methods as needed

  // Method to confirm the reservation
  confirmReservation() {
    this.isConfirmed = true;
    console.log(`Reservation ${this.#id} confirmed.`);
  }

  // Method to mark the reservation as paid

  payReservation() {
    this.isPaid = true;
    console.log(`Payment received for reservation ${this.#id}.`);
  }
}

// Define the ReservationManager class

class ReservationManager {
  constructor() {
    this.reservations = []; // Initialize an array to store reservations
  }

  // Method to add a reservation

  addReservation(reservation) {
    this.reservations.push(reservation);
    console.log(
      `Reservation added for ${reservation.customerName} on ${reservation.date}`
    );
  }

  // Method to cancel a reservation

  cancelReservation(reservationId) {
    //   // Filter out the reservation with the given ID
    //   this.reservations = this.reservations.filter(
    //     (reservation) => reservation.getId() !== reservationId
    //   );

    const reservationIndex = this.reservations.findIndex(
      (reservation) => reservation.getId() === reservationId
    );

    if (reservationIndex) {
      this.reservations = this.reservations.filter(
        (reservation) => reservation.getId() !== reservationId
      );
      console.log(`Reservation ${reservationId} cancelled.`);
    } else {
      console.log(`Reservation ${reservationId} not found.`);
    }
  }
}
