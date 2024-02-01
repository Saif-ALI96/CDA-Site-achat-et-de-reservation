-- TODO Table Utilisateur

-- Créer la Table
CREATE TABLE IF NOT EXISTS User (
    id_user SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(250) NOT NULL,
    password_user VARCHAR(100) NOT NULL,
    created_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Ajout d'une contrainte d'unicité sur :
    UNIQUE (email)
);


-- Fonction(trigger) --> created_dt
CREATE OR REPLACE FUNCTION set_created_date() -- déclare la fonction
RETURNS TRIGGER AS $created_date_user$ -- retourne la variable 'TRIGGER'
BEGIN -- la fonction démarre ici
    NEW.created_dt := CURRENT_TIMESTAMP; -- attribut la date et l'heure (actuel) à creation_dt
    RETURN NEW; -- retourne la nouvelle ligne modifiée
END; -- la fonction s'arrête ici
$created_date_user$ LANGUAGE plpgsql; -- la variable TRIGGER (en alias) + le language utilisé pour la BDD


-- Trigger --> created_dt
CREATE TRIGGER set_created_date_trigger -- On nomme le trigger, et on dit :
BEFORE INSERT ON User -- AVANT l'insersion des données (INSERT ON) dans la table User...
FOR EACH ROW -- ...et pour chacune des nouvelles lignes...
EXECUTE FUNCTION set_created_date(); -- on exécute la fonction TRIGGER


-- Fonction(trigger) --> modified_dt (même pratique que pour created_dt)
CREATE OR REPLACE FUNCTION set_modified_date() 
RETURNS TRIGGER AS $modified_date_user$
BEGIN
    NEW.modified_dt := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$modified_date_user$ LANGUAGE plpgsql;


-- Trigger --> modified_dt
CREATE TRIGGER set_modified_date_trigger
BEFORE INSERT ON User
FOR EACH ROW
EXECUTE FUNCTION set_modified_date();


-- Ajout des données
INSERT INTO "User" (first_name, last_name, email, password_user)
VALUES
    ('Alice', 'Dupont','alice.dupont@email.com','MotDePasse123'),
    ('Bob', 'Martin', 'bob.martin@email.com', 'SecurePass456'),
    ('Caroline', 'Lefevre', 'caroline.lefevre@email.com', 'Secret123!'),
    ('David', 'Gagnon', 'david.gagnon@email.com', 'PassWord789'),
    ('Eva', 'Roux', 'eva.roux@email.com', 'Secure1234')
-- clause ON CONFLICT pour éviter les doublons sur les email (va avec 'Ajout de contrainte UNIQUE' ligne 11)
ON CONFLICT (email) DO NOTHING;

-- Afficher la Table
SELECT * FROM User;


-- ------------------------------------------------------------------------
-- TODO Table Véhicule

-- Créer la Table
CREATE TABLE IF NOT EXISTS Vehicle (
    id_vehicle SERIAL PRIMARY KEY,
    model VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL,
    created_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Contrainte :
    UNIQUE (model)
);


-- Fonction(trigger) --> created_dt
CREATE OR REPLACE FUNCTION set_created_date()
RETURNS TRIGGER AS $created_date_user$ 
BEGIN
    NEW.created_dt := CURRENT_TIMESTAMP; 
    RETURN NEW;
END;
$created_date_user$ LANGUAGE plpgsql;


-- Trigger --> created_dt
CREATE TRIGGER set_created_date_trigger 
BEFORE INSERT ON Vehicle
FOR EACH ROW
EXECUTE FUNCTION set_created_date();


-- Fonction(trigger) --> modified_dt
CREATE OR REPLACE FUNCTION set_modified_date() 
RETURNS TRIGGER AS $modified_date_user$
BEGIN
    NEW.modified_dt := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$modified_date_user$ LANGUAGE plpgsql;


-- Trigger --> modified_dt
CREATE TRIGGER set_modified_date_trigger
BEFORE INSERT ON Vehicle
FOR EACH ROW
EXECUTE FUNCTION set_modified_date();


-- Ajout des données
INSERT INTO Vehicle (model, price)
VALUES
    ('City - 1.5 ddCi - Diesel - 90hp', 21500.00),
    ('Family - 1.2 TFe - Gasoline - 130hp', 336500.00),
    ('Sportive - 2.0 SPi - Gasoline - 240hp', 21500.00)
-- clause ON CONFLICT
ON CONFLICT (model) DO NOTHING;

-- Afficher la Table
SELECT * FROM Vehicle;


-- ------------------------------------------------------------------------
-- TODO Table Couleur

-- Créer la Table
CREATE TABLE IF NOT EXISTS VehicleColor (
    id_color SERIAL PRIMARY KEY,
    color_name VARCHAR(100) NOT NULL,
    color_price FLOAT NOT NULL,
    id_vehicle INT NOT NULL REFERENCES Vehicle (id_vehicle),
    created_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Contrainte :
    UNIQUE (color_name)
);


-- Fonction(trigger) --> created_dt
CREATE OR REPLACE FUNCTION set_created_date()
RETURNS TRIGGER AS $created_date_user$ 
BEGIN
    NEW.created_dt := CURRENT_TIMESTAMP; 
    RETURN NEW;
END;
$created_date_user$ LANGUAGE plpgsql;


-- Trigger --> created_dt
CREATE TRIGGER set_created_date_trigger 
BEFORE INSERT ON VehicleColor
FOR EACH ROW
EXECUTE FUNCTION set_created_date();


-- Fonction(trigger) --> modificated_dt
CREATE OR REPLACE FUNCTION set_modified_date() 
RETURNS TRIGGER AS $modified_date_user$
BEGIN
    NEW.modified_dt := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$modified_date_user$ LANGUAGE plpgsql;


-- Trigger --> modified_dt
CREATE TRIGGER set_modified_date_trigger
BEFORE INSERT ON VehicleColor
FOR EACH ROW
EXECUTE FUNCTION set_modified_date();


-- Ajout des données
INSERT INTO VehicleColor (color_name, color_price, id_vehicle)
VALUES
    ('Black', 450.00),
    ('Red', 750.00),
    ('Metallic Gray', 1000.00)
-- clause ON CONFLICT
ON CONFLICT (color_name) DO NOTHING;

-- Afficher la Table
SELECT * FROM VehicleColor;


-- ------------------------------------------------------------------------
-- TODO Table Options

-- Créer la Table
CREATE TABLE IF NOT EXISTS VehicleOption (
    id_option SERIAL PRIMARY KEY,
    option_name VARCHAR(100) NOT NULL,
    option_price FLOAT NOT NULL,
    id_vehicle INT NOT NULL REFERENCES Vehicle (id_vehicle),
    created_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Contrainte :
    UNIQUE (option_name)
);


-- Fonction(trigger) --> created_dt
CREATE OR REPLACE FUNCTION set_created_date()
RETURNS TRIGGER AS $created_date_user$ 
BEGIN
    NEW.created_dt := CURRENT_TIMESTAMP; 
    RETURN NEW;
END;
$created_date_user$ LANGUAGE plpgsql;


-- Trigger --> created_dt
CREATE TRIGGER set_created_date_trigger 
BEFORE INSERT ON VehicleOption
FOR EACH ROW
EXECUTE FUNCTION set_created_date();


-- Fonction(trigger) --> modificated_dt
CREATE OR REPLACE FUNCTION set_modified_date() 
RETURNS TRIGGER AS $modified_date_user$
BEGIN
    NEW.modified_dt := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$modified_date_user$ LANGUAGE plpgsql;


-- Trigger --> modified_dt
CREATE TRIGGER set_modified_date_trigger
BEFORE INSERT ON VehicleOption
FOR EACH ROW
EXECUTE FUNCTION set_modified_date();


-- Ajout des données
INSERT INTO VehicleOption (option_name, option_price, id_vehicle)
VALUES
    ('Cruise control/speed limiter', 350.00),
    ('Gps', 600.00),
    ('Heated seats', 900.00)
-- clause ON CONFLICT
ON CONFLICT (option_name) DO NOTHING;

-- Afficher la Table
SELECT * FROM VehicleOption;


-- ------------------------------------------------------------------------
-- TODO Table Réservation

-- Créer la Table
CREATE TABLE IF NOT EXISTS Reservation (
    id_reservation SERIAL PRIMARY KEY,
    status_order VARCHAR(100),
    customer_name VARCHAR(100) NOT NULL, -- voir SAIF : Attibut est-il vraiment nécessaire puisqu'on a déjà le lien avec la Table User avec la clé étrangère id_user ? 
                                  -- On pourrait ajouter une fonction au SELECT/FROM plutôt ?
    is_confirmed BOOLEAN NOT NULL,
    is_paid BOOLEAN NOT NULL,
    id_vehicle INT NOT NULL REFERENCES Vehicle (id_vehicle),
    id_user INT NOT NULL REFERENCES User (id_user),
    created_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Contrainte :
    UNIQUE (customer_name)
);


-- Fonction(trigger) --> created_dt
CREATE OR REPLACE FUNCTION set_created_date()
RETURNS TRIGGER AS $created_date_user$ 
BEGIN
    NEW.created_dt := CURRENT_TIMESTAMP; 
    RETURN NEW;
END;
$created_date_user$ LANGUAGE plpgsql;


-- Trigger --> created_dt
CREATE TRIGGER set_created_date_trigger 
BEFORE INSERT ON Reservation
FOR EACH ROW
EXECUTE FUNCTION set_created_date();


-- Fonction(trigger) --> modificated_dt
CREATE OR REPLACE FUNCTION set_modified_date() 
RETURNS TRIGGER AS $modified_date_user$
BEGIN
    NEW.modified_dt := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$modified_date_user$ LANGUAGE plpgsql;


-- Trigger --> modified_dt
CREATE TRIGGER set_modified_date_trigger
BEFORE INSERT ON Reservation
FOR EACH ROW
EXECUTE FUNCTION set_modified_date();


-- Ajout des données
INSERT INTO Reservation (status_order, customer_name, is_confirmed, is_paid, id_vehicle, id_user)
VALUES ()
-- clause ON CONFLICT
ON CONFLICT (customer_name) DO NOTHING;

-- Afficher la Table
SELECT * FROM Reservation;
-- Ajouter fonction pour afficher nom et prénom du client ?


-- ------------------------------------------------------------------------
-- TODO Table Notifications

-- Créer la Table
CREATE TABLE IF NOT EXISTS Notifications (
    id_notif SERIAL PRIMARY KEY,
    message_notif TEXT NOT NULL,
    date_notif DATE NOT NULL, -- date notif. ou date réservation ?
    id_user INT NOT NULL REFERENCES User (id_user),
    created_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);


-- Fonction(trigger) --> created_dt
CREATE OR REPLACE FUNCTION set_created_date()
RETURNS TRIGGER AS $created_date_user$ 
BEGIN
    NEW.created_dt := CURRENT_TIMESTAMP; 
    RETURN NEW;
END;
$created_date_user$ LANGUAGE plpgsql;


-- Trigger --> created_dt
CREATE TRIGGER set_created_date_trigger 
BEFORE INSERT ON Notifications
FOR EACH ROW
EXECUTE FUNCTION set_created_date();


-- Fonction(trigger) --> modificated_dt
CREATE OR REPLACE FUNCTION set_modified_date() 
RETURNS TRIGGER AS $modified_date_user$
BEGIN
    NEW.modified_dt := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$modified_date_user$ LANGUAGE plpgsql;


-- Trigger --> modified_dt
CREATE TRIGGER set_modified_date_trigger
BEFORE INSERT ON Notifications
FOR EACH ROW
EXECUTE FUNCTION set_modified_date();


-- Ajout des données
INSERT INTO Notifications (message_notif, date_notif, id_user)
VALUES ()
;

-- Afficher la Table
SELECT * FROM Notifications;