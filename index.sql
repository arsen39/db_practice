DROP TABLE "workers";

CREATE TABLE "workers"(
  "id" serial PRIMARY KEY,
  "name" varchar (64) NOT NULL,
  "birthday" date NOT NULL CHECK (
    "birthday" < current_date
    AND "birthday" > '1900/1/1'
  ),
  "salary" decimal (7,2) CHECK ("salary" > 0)
);

INSERT INTO "workers" ("name", "birthday","salary") 
VALUES ('Mykyta', '1990-11-02', 300),
('Svitlana', '1997-01-13', 1200),
('Yaroslav', '1980-06-11', 1200),
('Petro', '1993-03-26', 1000),
('Vasyl', '1974-04-08', 300),
('Bogdan', '1994-02-03', 900),
('Olena', '1992-12-12', 900),
('Mykola', '1984-04-26', 1300);

UPDATE "workers" 
SET "salary" = 200
WHERE "name" = 'Vasyl'

UPDATE "workers" 
SET "birthday" = '1987-03-26'
WHERE "id" = 4

UPDATE "workers" 
SET "salary" = 700
WHERE "salary" = 500

UPDATE "workers" 
SET "birthday" = '1990-10-22'
WHERE "id" BETWEEN 3 AND 4

UPDATE "workers" 
SET "name" = 'Evgen',
"birthday" = '1996-01-16',
"salary" = 900
WHERE "name" = 'Vasyl';

SELECT *
FROM "workers"
WHERE "id" = 3;

SELECT *
FROM "workers"
WHERE "salary" > 400;

SELECT *
FROM "workers"
WHERE "salary" != 400;

SELECT "salary",
extract (years from age("birthday")) AS "age"
FROM "workers"
WHERE "name" = 'Evgen';

SELECT *
FROM "workers"
WHERE "name" = 'Petro';

SELECT *
FROM "workers"
WHERE "name" != 'Petro';

SELECT *
FROM "workers"
WHERE extract (years from age("birthday")) = 27 OR "salary" = 1000;

SELECT *
FROM "workers"
WHERE extract (years from age("birthday")) BETWEEN 26 AND 28

SELECT *
FROM "workers"
WHERE extract (years from age("birthday")) BETWEEN 23 AND 27 AND "salary" BETWEEN 400 AND 1000

SELECT *
FROM "workers"
WHERE extract (years from age("birthday")) = 27 AND "salary" != 400

DELETE FROM "workers"
WHERE "id" = 7;

DELETE FROM "workers"
WHERE "name" = 'Mykola';

DELETE FROM "workers"
WHERE extract (years from age("birthday")) = 23;

CREATE TABLE "positions"(
  "id" serial PRIMARY KEY,
  "name_of_position" varchar (128) NOT NULL
);

INSERT INTO "positions" ("name_of_position") 
VALUES ('Junior'),
('Middle'),
('Senior'),
('Team lead');

DROP TABLE "positions_to_users"

CREATE TABLE "positions_to_users"(
  "id" serial PRIMARY KEY,
  "worker_id" int REFERENCES "workers" ("id"),
  "position_id" int REFERENCES "positions" ("id")
);

INSERT INTO "positions_to_users" ("worker_id", "position_id")
VALUES (1,1),
(5,1),
(6,2),
(7,2);




