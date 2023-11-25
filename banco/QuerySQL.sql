CREATE DATABASE techfix;
USE techfix;

-- Tabela de Usuarios do Sistema (LOGIN) --
CREATE TABLE Usuarios (
iduser int primary key,
Usuario VARCHAR(50) not null,
Login VARCHAR(15) not null unique,
Senha VARCHAR(15) not null
);
DESCRIBE Usuarios;
SELECT * FROM Usuarios;

UPDATE Usuarios set U='123@Mudar' where iduser=3;
DELETE FROM Usuarios where iduser=3;

ALTER TABLE Usuarios CHANGE Usuario Nome varchar(50);



-- ADICIONANDOO UM CAMPO NA TABELA USUARIOS --
ALTER TABLE Usuarios add column Perfil VARCHAR(20) NOT NULL;


-- REMOVENDO UM CAMPO NA TABELA USUARIOS --
ALTER TABLE Usuarios drop column Perfil ;

UPDATE Usuarios SET perfil='admin' WHERE iduser=1;
UPDATE Usuarios SET perfil='admin' WHERE iduser=2;
UPDATE Usuarios SET perfil='user' WHERE iduser=3;






-- Tabela de Clientes --
CREATE TABLE Clientes(
idcli int primary key auto_increment,
nomecli VARCHAR(90) NOT NULL,
endcli VARCHAR(90),
fonecli VARCHAR(90) NOT NULL,
cpfcli VARCHAR(30),
emailcli VARCHAR(90)
);

DESCRIBE Clientes;
INSERT INTO Clientes(nomecli, endcli, fonecli, emailcli)
VALUES ('AFYA TECNOLOGIA LTDA','Av Paulista, 12','(11) 4569-0900','compras@afya.com');
INSERT INTO Clientes(nomecli, endcli, fonecli, emailcli)
VALUES ('JAMEF TRANSPORTES','R. Barra Funda, 439','(11) 3391-4188','contato@jamef.com.br');

SELECT * FROM Clientes;
ALTER TABLE Clientes add column cpfcli VARCHAR(15);


SELECT idcli as ID, nomecli as Nome, endcli as Endereço, fonecli as Fone, emailcli as Email, cpfcli as CPFC_CNPJ from Clientes;


-- Tabela Ordem de Serviço --
CREATE TABLE os (
os int primary key auto_increment,
data_os TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- gera data e hora quando houver um insert
equipamento VARCHAR(100) NOT NULL,
defeito VARCHAR(100),
servico VARCHAR(100), 
tecnico VARCHAR(50),
valor decimal(10,2),

idcli int not null,
foreign key(idcli) references Clientes(idcli)
);

SELECT * FROM os;
DESCRIBE os;

INSERT INTO os (equipamento, defeito, servico, tecnico, valor, idcli)
VALUES('Notebook ASUS','Bateria Derreteu','Troca de bateria','Zé',89.90,1); 

SELECT idcli as Id,nomecli as Nome,fonecli as Fone from Clientes where nomecli like 'a%';
alter table os add statuss varchar(40) not null after tipo;

-- Inner Join de Tabelas --
SELECT
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from os as O
inner join clientes as C
on (O.idcli = C.idcli);

-- Formatar data e hora --
SELECT os,date_format(data_os,'%d/%m/%Y - %H:%i'),tipo,statuss,equipamento,defeito,servico,valor,idcli from os where os=1; 



-- Ordem de cliente por nome --

SELECT * FROM Clientes ORDER BY nomecli;

-- --
select OSER.os,data_os,tipo,statuss,equipamento,valor,
CLI.nomecli,fonecli, cpfcli
from os as OSER inner join Clientes as CLI on (CLI.idcli = OSER.idcli);

-- -- 
select * from os where os= 8;

-- --
select max(os) from os;
