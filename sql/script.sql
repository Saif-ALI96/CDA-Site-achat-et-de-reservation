CREATE TABLE IF NOT EXISTS Users(
  id_user SERIAL,
  first_name VARCHAR(50) not null,
  last_name VARCHAR(50) not null ,
  email VARCHAR(200) not null,
  password_user VARCHAR(200) not null,
  is_email_verified Boolean noT null,
  created_dt DATE DEFAULT CURRENT_DATE,
  modificated_dt DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(id_user)
);

CREATE TABLE IF NOT EXISTS Notifications(
  id_notif SERIAL,
  message_notif TEXT not null,
  id_user INT,
  date_notif DATE not null,
  created_dt DATE DEFAULT CURRENT_DATE,
  modificated_dt DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(id_notif),
  CONSTRAINT fk_users_notification
  FOREIGN KEY (id_user)
  REFERENCES Users(id_user)
);

CREATE TABLE IF NOT EXISTS Vehicle(
  id_vehicle SERIAL,
  model VARCHAR(100) not null,
  price FLOAT not null, 
  created_dt DATE DEFAULT CURRENT_DATE,
  modificated_dt DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(id_vehicle)
);

CREATE TABLE IF NOT EXISTS Reservation(
  id_reservation SERIAL,
  status_order VARCHAR(100) not null,
  customer_name VARCHAR(100) not null,
  id_vehicle INT,
  id_user INT,
  created_dt DATE DEFAULT CURRENT_DATE,
  modificated_dt DATE DEFAULT CURRENT_DATE,
  is_confirmed Boolean,
  is_paid Boolean,
  PRIMARY KEY(id_reservation),
  CONSTRAINT fk_vehicle_reservation
  FOREIGN KEY (id_vehicle)
  REFERENCES Vehicle(id_vehicle),
  CONSTRAINT fk_users_reservation
  FOREIGN KEY (id_user)
  REFERENCES Users(id_user)
);

CREATE TABLE IF NOT EXISTS VehicleOption(
  id_option SERIAL,
  option_name VARCHAR(100) not null,
  option_price FLOAT not null, 
  id_vehicle INT,
  created_dt DATE DEFAULT CURRENT_DATE,
  modificated_dt DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(id_option),
  CONSTRAINT fk_vehicle_vehicleOption
  FOREIGN KEY (id_vehicle)
  REFERENCES Vehicle(id_vehicle)
);

CREATE TABLE IF NOT EXISTS VehicleColor(
  id_color SERIAL,
  color_name VARCHAR(100) not null, 
  id_vehicle INT,
  created_dt DATE DEFAULT CURRENT_DATE,
  modificated_dt DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(id_color),
  CONSTRAINT fk_vehicle_vehicleColor
  FOREIGN KEY (id_vehicle)
  REFERENCES Vehicle(id_vehicle)
);


CREATE OR REPLACE FUNCTION update_modified_dt()
RETURNS TRIGGER AS $$
BEGIN
  NEW.modified_dt = CURRENT_DATE;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_modified_dt_trigger
BEFORE UPDATE ON Users
FOR EACH ROW
EXECUTE FUNCTION update_modified_dt();

CREATE TRIGGER update_vehicle_modified_dt_trigger
BEFORE UPDATE ON Vehicle
FOR EACH ROW
EXECUTE FUNCTION update_modified_dt();

CREATE TRIGGER update_reservation_modified_dt_trigger
BEFORE UPDATE ON Reservation
FOR EACH ROW
EXECUTE FUNCTION update_modified_dt();

CREATE TRIGGER update_notifications_modified_dt_trigger
BEFORE UPDATE ON Notifications
FOR EACH ROW
EXECUTE FUNCTION update_modified_dt();

CREATE TRIGGER update_notifications_modified_dt_trigger
BEFORE UPDATE ON VehicleOption
FOR EACH ROW
EXECUTE FUNCTION update_modified_dt();

CREATE TRIGGER update_notifications_modified_dt_trigger
BEFORE UPDATE ON VehicleColor
FOR EACH ROW
EXECUTE FUNCTION update_modified_dt();


-- Exemples de données pour la table Users
INSERT INTO Users (first_name, last_name, email, password_user, is_email_verified, created_dt, modificated_dt)
VALUES 
  ('John', 'Doe', 'john.doe@email.com', 'hashed_password_1', true, CURRENT_DATE, CURRENT_DATE),
  ('Jane', 'Smith', 'jane.smith@email.com', 'hashed_password_2', true, CURRENT_DATE, CURRENT_DATE),
  ('Bob', 'Johnson', 'bob.johnson@email.com', 'hashed_password_3', false, CURRENT_DATE, CURRENT_DATE);

-- Exemples de données pour la table Notifications
INSERT INTO Notifications (message_notif, id_user, date_notif, created_dt, modificated_dt)
VALUES 
  ('New message 1', 1, '2024-02-01', CURRENT_DATE, CURRENT_DATE),
  ('New message 2', 2, '2024-02-02', CURRENT_DATE, CURRENT_DATE),
  ('New message 3', 3, '2024-02-03', CURRENT_DATE, CURRENT_DATE);

-- Exemples de données pour la table Vehicle
INSERT INTO Vehicle (model, price, created_dt, modificated_dt)
VALUES 
  ('Car Model A', 25000.00, CURRENT_DATE, CURRENT_DATE),
  ('Car Model B', 35000.00, CURRENT_DATE, CURRENT_DATE);

-- Exemples de données pour la table Reservation
INSERT INTO Reservation (status_order, customer_name, id_vehicle, id_user, is_confirmed, is_paid, created_dt, modificated_dt)
VALUES 
  ('Pending', 'John Doe', 1, 1, false, false, CURRENT_DATE, CURRENT_DATE),
  ('Confirmed', 'Jane Smith', 2, 2, true, true, CURRENT_DATE, CURRENT_DATE),
  ('Pending', 'Bob Johnson', 1, 3, false, false, CURRENT_DATE, CURRENT_DATE);

-- Exemples de données pour la table VehicleOption
INSERT INTO VehicleOption (option_name, option_price, id_vehicle, created_dt, modificated_dt)
VALUES 
  ('Leather Seats', 1000.00, 1, CURRENT_DATE, CURRENT_DATE),
  ('Sunroof', 800.00, 2, CURRENT_DATE, CURRENT_DATE),
  ('GPS Navigation', 1200.00, 1, CURRENT_DATE, CURRENT_DATE);

-- Exemples de données pour la table VehicleColor
INSERT INTO VehicleColor (color_name, id_vehicle, created_dt, modificated_dt)
VALUES 
  ('Red', 1, CURRENT_DATE, CURRENT_DATE),
  ('Blue', 2, CURRENT_DATE, CURRENT_DATE),
  ('Silver', 1, CURRENT_DATE, CURRENT_DATE);


select * from Users;