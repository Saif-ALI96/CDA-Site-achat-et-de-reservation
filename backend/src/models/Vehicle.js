"use strict";

class Vehicle {
  #id;

  constructor(id, model, color, options, price) {
    (this.#id = id),
      (this.model = model),
      (this.color = color),
      (this.options = options || []),
      // (this.options = []),
      (this.price = price);
  }

  getId() {
    return this.#id;
  }

  chooseModel(chooseModel, basePrice) {
    this.model = chooseModel;
    this.price = basePrice;
  }

  setColor(choseColor) {
    this.color = choseColor;
  }

  setOptions(optionName, optionPrice) {
    this.options[optionName] = optionPrice;
  }

  calculatePrice() {
    let totalPrice = this.price;
    for (price of Object.values(this.options)) {
      totalPrice += price;
    }
    return totalPrice;
  }
}
