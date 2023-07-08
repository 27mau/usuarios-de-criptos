create database criptos;

use criptos

show TABLES;

select * from productos;

create table usuarios (
	usuario_id INT unsigned auto_increment primary key,
	nombre VARCHAR(30) not null,
	apellidos VARCHAR(30) not null,
	correo VARCHAR(50) unique,
	portafolio INT default 0,
	ingresos INT,
	retiros INT
	);

drop table usuarios;

describe usuarios;

insert into usuarios (nombre, apellidos, correo, portafolio, ingresos, retiros) values
	("Martín", "Gonzalez", "martin.gonzales@gmail.com", 2000, 2600, 500),
	("Sofía", "Torres", "sofi.torres@gmail.com", 5000, 2100, 500),
	("Juan", "López", "juan.lopez@gmail.com", 5000, 1400,600),
	("Valentina", "Martínez", "valen.martinez@gmail.com", 3500, 200, 800),
	("Manuel", "Gómez", "manu.gomez@gmail.com", 14200, 600, 1200),
	("Alejandro", "Romano", "ale.romano@gmail.com", 7400, 2000, 1200),
	("Carlos", "Conti", "carlos.conti@gmail.com", 9800, 1400, 2200),
	("Maria","García", "maria.garcia@gmail.com", 4600 ,2100, 500);

select * from usuarios;

select * from usuarios where nombre = "Carlos";

select * from usuarios where apellidos like 'G%';

select * from usuarios where correo like '%@gmail.com'; 
	
select * from usuarios where nombre like '%an%';

select * from usuarios where ingresos between 2000 and 3000;

select ingresos, count(*) as total from usuarios group by ingresos;

select portafolio, count(*) as total from usuarios where ingresos = 1400
group by portafolio having total;

select distinct ingresos from usuarios;

select distinct retiros from usuarios;

select * from usuarios order by nombre asc;

select * from usuarios order by portafolio desc;

select * from usuarios order by retiros desc;

select * from usuarios where nombre regexp '[t-z]';

show index from usuarios;

alter table usuarios add index i_retiros_ingresos (retiros, ingresos);

