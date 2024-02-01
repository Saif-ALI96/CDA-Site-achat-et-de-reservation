"use strict";

class VehicleFactory {
  static instance = null;

  static getInstance() {
    if (VehicleFactory.instance === null) {
      VehicleFactory.instance = new VehicleFactory();
      return VehicleFactory.instance;
    }
  }
  createVehicle() {
    throw new Error("This method should be implemented by sub classes");
  }
}

class ConcreteVehicleFactory extends VehicleFactory {
  createVehicle(id, model, color, options, price) {
    return new Vehicle(id, model, color, options, price);
  }
}
