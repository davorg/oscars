DROP TABLE IF EXISTS ceremony;
CREATE TABLE ceremony (
id integer NOT NULL PRIMARY KEY,
ceremony_year integer NOT NULL UNIQUE,
release_year integer NOT NULL UNIQUE,
ceremony_number integer NOT NULL UNIQUE
);

DROP TABLE IF EXISTS category;
CREATE TABLE category (
id integer NOT NULL PRIMARY KEY,
name char(50),
subname char(50),
UNIQUE (name, subname)
);

DROP TABLE IF EXISTS film;
CREATE TABLE film (
id integer NOT NULL PRIMARY KEY,
title char(250) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS nomination;
CREATE TABLE nomination (
ceremony_id integer NOT NULL,
category_id integer NOT NULL,
film_id integer NOT NULL,
text char(150),
winner integer,
UNIQUE(ceremony_id, category_id, film_id, text),
FOREIGN KEY (ceremony_id) REFERENCES ceremony(id),
FOREIGN KEY (category_id) REFERENCES category(id),
FOREIGN KEY (film_id) REFERENCES film(id)
);
