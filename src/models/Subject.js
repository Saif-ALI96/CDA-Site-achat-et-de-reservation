"use strict";

class Observer {
  update(message) {
    console.log(`Observer : ${message}`);
  }
}

class Subject {
  constructor() {
    this.observers = [];
  }

  attach(observer) {
    this.observers.push(observer);
  }

  detach(observer) {
    this.observers = this.observers.filter(
      (observers) => observers !== observer
    );
  }

  notify(message) {
    this.observers.forEach((observers) => observers.update(message));
  }
}
