create database criptos2;

drop database criptos2;

use criptos2

show TABLES;

CREATE TABLE pais (
  pais_id INT unsigned auto_increment primary key,
  pais VARCHAR(30) not null
);

select * from pais;

CREATE TABLE billetera (
  billetera_id INT unsigned auto_increment primary key,
  tipo_billetera VARCHAR(50) not null
 );

select * from billetera;

CREATE TABLE ingresos_y_retiros (
  ingresos_y_retiros_id INT unsigned auto_increment primary key,
  ingreso DECIMAL(10, 2),
  fecha_ingreso DATE,
  retiro DECIMAL(10, 2),
  fecha_retiro DATE);

select * from ingresos_y_retiros;

CREATE TABLE tipos_de_criptomonedas (
  tipos_de_criptomonedas_id INT unsigned auto_increment primary key,
  cripto1 VARCHAR(50),
  cripto2 VARCHAR(50),
  cripto3 VARCHAR(50),
  cripto4 VARCHAR(50),
  cripto5 VARCHAR(50),
  cripto6 VARCHAR(50)
);

select * from tipos_de_criptomonedas;

CREATE TABLE usuarios (
  usuarios_id INT unsigned auto_increment primary key,
  nombre VARCHAR(30),
  apellido VARCHAR(30),
  pais int  unsigned,
  billetera int unsigned,
  ingresos_y_retiros int unsigned,
  tipos_de_criptomonedas int unsigned,
  foreign key (pais) references pais(pais_id),
  foreign key (billetera) references billetera(billetera_id),
  foreign key (ingresos_y_retiros) references ingresos_y_retiros(ingresos_y_retiros_id),
  foreign key (tipos_de_criptomonedas) references tipos_de_criptomonedas(tipos_de_criptomonedas_id)
);

select * from usuarios;

insert into usuarios values
	(1, "Martín", "Gonzalez", 4, 5, 8, 8),
	(2, "Sofía", "Torres", 1, 4, 7, 1),
	(3, "Juan", "López", 2, 4, 5, 2),
	(4, "Valentina", "Martínez", 3, 1, 1, 5),
	(5, "Manuel", "Gómez", 2, 2, 3, 3),
	(6, "Alejandro", "Romano", 3, 2, 5, 6),
	(7, "Carlos", "Conti", 1, 5, 4, 3),
	(8, "Maria","García", 1, 3, 2, 4);

insert into pais values
	(1, "Argentina"),
	(2, "Uruguay"),
	(3, "Colombia"),
	(4, "Chile");

insert into billetera values
	(1, "Ledger Nano S"),
	(2, "MetaMask"),
	(3, "Trust Wallet"),
	(4, "Exodus Wallet"),
	(5, "Coinbase Wallet");
	
insert into ingresos_y_retiros values
	(1, 3500, '2023/05/08', 200, '2023/06/23'),
  	(2,14000, '2023/06/02', 1200, '2023/06/03'),
  	(3,6700, '2023/04/07', 1800, '2023/06/06'),
  	(4,1400, '2023/05/04', 1900, '2023/05/31'),
  	(5,13500, '2023/06/18', 2100, '2023/06/18'),
  	(6,8500, '2023/04/09', 3000, '2023/05/21'),
  	(7,3700, '2023/05/24', 1500, '2023/05/03'),
	(8,4800, '2023/05/14', 2600, '2023/06/13');

select * from ingresos_y_retiros;

insert into tipos_de_criptomonedas values
	(1, "BTC", "ETH", "DOT", "XRP", "USDT", null),
  	(2, "BTC", "ADA", "DOT", "BNB", "USDT", null),
  	(3,"ETH", "BTC", "BNB", "LTC", "ADA", "USDT"),
  	(4,"BTC", "USDT", "ETH", "LTC", null, null),
  	(5, "USDT", "BTC", "ETH", "BNB", null, null),
  	(6, "BTC", "ADA", "XRP", "USDT", "DOT", "ETH"),
  	(7, "BTC", "ETH", "ADA", "DOT", "USDT", null),
	(8, "BTC", "LTC", "ETH", "USDT", "ADA", "BNB");

select * from usuarios u
	left join billetera b
	on u.billetera = b.billetera_id;

select * from usuarios u
	right join billetera b
	on u.billetera = b.billetera_id;

select u.usuarios_id, u.nombre, u.billetera, p.pais
	from usuarios u
	inner join billetera b on u.billetera = b.billetera_id
	inner join pais p on u.pais = p.pais_id;

select pais,
	(select count(*) from usuarios u where u.pais = p.pais_id)
	as total_usuarios
	from pais p;