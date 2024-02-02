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



INSERT INTO Users (first_name, last_name, email, password_user, is_email_verified, created_dt, modificated_dt)
VALUES ('John', 'Doe', 'john.doe@example.com', 'hashed_password', true, CURRENT_DATE, CURRENT_DATE);

select * from Users;