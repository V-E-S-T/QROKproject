DROP TABLE IF EXISTS authors_books;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS rewards;
DROP TABLE IF EXISTS authors;



# DROP SEQUENCE IF EXISTS global_seq;
#
# CREATE SEQUENCE global_seq START 100000;
#
# CREATE TABLE users
# (
#   id               INTEGER PRIMARY KEY,
#   name             VARCHAR()                NOT NULL,
#   email            VARCHAR                 NOT NULL,
#   password         VARCHAR                 NOT NULL,
#   registered       TIMESTAMP DEFAULT now() NOT NULL,
#   enabled          BOOL DEFAULT TRUE       NOT NULL,
#   calories_per_day INTEGER DEFAULT 2000    NOT NULL
# );
# CREATE UNIQUE INDEX users_unique_email_idx ON users (email);
#
# CREATE TABLE user_roles
# (
#   user_id INTEGER NOT NULL,
#   role    VARCHAR,
#   CONSTRAINT user_roles_idx UNIQUE (user_id, role),
#   FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
# );
#
# CREATE TABLE meals (
#   id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
#   user_id     INTEGER   NOT NULL,
#   date_time   TIMESTAMP NOT NULL,
#   description TEXT      NOT NULL,
#   calories    INT       NOT NULL,
#   FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
# );
# CREATE UNIQUE INDEX meals_unique_user_datetime_idx ON meals (user_id, date_time);


CREATE SCHEMA IF NOT EXISTS qrok DEFAULT CHARACTER SET utf8;
USE qrok;
CREATE TABLE books(

  id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(100),
  isbn varchar(255),
  genre varchar(100))
  DEFAULT CHARACTER SET = utf8;

CREATE TABLE authors(

  id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(255),
  sex VARCHAR(100),
  birth_date DATE)

  DEFAULT CHARACTER SET = utf8;

CREATE TABLE rewards(

  id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  author_id INT(10),
  year INT(20),
  title VARCHAR(255),
  FOREIGN KEY (author_id) REFERENCES authors (id))
  DEFAULT CHARACTER SET = utf8;



CREATE TABLE authors_books(

  author_id INT(10) NOT NULL,
  book_id INT(10) NOT NULL,
  FOREIGN KEY (author_id) REFERENCES authors (id),
  FOREIGN KEY (book_id) REFERENCES books (id))
  DEFAULT CHARACTER SET = utf8;




