/*---------Entidades y las relaciones--------*/

--Tablas

CREATE TYPE "level" AS ENUM (
  'beginners',
  'intermediate',
  'advanced'
);

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text,
  "level" level,
  "teacher" varchar NOT NULL
);

CREATE TABLE "courses_video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar,
  "categories_id" int,
  "courses_id" int
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "users_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "users_id" int,
  "courses_id" int
);

--Relaciones

ALTER TABLE "courses_video" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "courses_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

/*---Agregar 2 registros por tabla------*/

-- insertar registros a tabla users

insert into users (
	name,
	email,
	password,
	age
) values 
(
	
	'Esmir Roque',
	'Roque@gmail.com',
	'root',
	31

),
(

	'Cesar Cortéz',
	'cesar@gmail.com',
	'12345',
	20
);

-- insertar registros a tabla categories
insert into categories(
name
) values (
'Algoritmo') ,(
'JavaScript') ,
('React'
);

-- insertar registros a tabla courses
insert into courses (
	title,
	description,
	level,
	teacher	
) values (

	'Fundamentos',
	'Aprenderas a HMTL, CSS y JavaScript',
	'beginners',
	'Juan Pérez'
),
(

	'Desarrollo Fronted con REACT',
	'Aprenderas a usar la librería REACT y a trabajar con componentes',
	'intermediate',
	'Carlos Reyes'
);

-- insertar registros a tabla courses_video
insert into courses_video  (

	title,
	url,
	categories_id,
	courses_id
) values (
	
	'Introducción a HTMl',
	'https://youtube.com/html',
	1,
	1
),(

	'Concepto de REACT',
	'htts://react-concept.react.com',
	2,
	2
	
);

-- insertar registros a tabla users_courses

insert into users_courses (
	users_id,
	courses_id 
) values (
	1,
	2
), (
	1,
	1
);

-- insetar otro registro a la tabla users_courses
insert into users_courses (
	users_id,
	courses_id 
) values (
	2,
	2
);

-- consutar los usuarios a que curso pertenecen
SELECT users.id, users.name, users.email, courses.title, courses.description , courses.level
FROM users 
JOIN users_courses ON users.id = users_courses.users_id
JOIN courses  ON users_courses.courses_id = courses.id;
