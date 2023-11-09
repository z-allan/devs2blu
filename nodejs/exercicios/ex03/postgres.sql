CREATE DATABASE apinodejs
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
    
CREATE SCHEMA IF NOT EXISTS api
    AUTHORIZATION postgres;

CREATE TABLE IF NOT EXISTS api.tb_produto (
    id integer NOT NULL DEFAULT nextval('api.tb_produto_id_seq'::regclass),
    nome character varying(100) COLLATE pg_catalog."default",
    preco double precision,
    fabricante character varying(100) COLLATE pg_catalog."default",
    descricao character varying(100) COLLATE pg_catalog."default"
)

select * from api.tb_produto

insert into api.tb_produto (nome, preco, fabricante, descricao) 
values ('Fusca',7500.50,'VW','Das Auto');
insert into api.tb_produto (nome, preco, fabricante, descricao) 
values ('iPhone',17500.50,'Apple','Não é um celular é um iPhone');
insert into api.tb_produto (nome, preco, fabricante, descricao) 
values ('Picanha',47.5,'Boi','Na real é coxão-duro');
insert into api.tb_produto (nome, preco, fabricante, descricao) 
values ('Cachaça de Abacaxi',38.99,'Spezia','Essa é top');
insert into api.tb_produto (nome, preco, fabricante, descricao) 
values ('Pentium 3',5000,'Positivo','Não é uma Brastemp');
insert into api.tb_produto (nome, preco, fabricante, descricao) 
values ('iPad',25500.50,'Apple','Não é um tablet qualquer');
insert into api.tb_produto (nome, preco, fabricante, descricao) 
values ('Urna Eletrônica',1.99,'Venezuela Corp.','#confia');

select * from api.tb_produto where nome like '%Não%' or fabricante like '%Não%' or descricao like '%Não%'
