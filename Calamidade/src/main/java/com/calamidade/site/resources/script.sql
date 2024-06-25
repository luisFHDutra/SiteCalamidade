create database bancocalamidade;

create table usuario(id serial PRIMARY KEY, usuario text, senha text, email text);
insert into usuario (usuario, senha, email) values ('admin', 'admin', 'admin@gmail.com');

CREATE TABLE ocorrencia (id serial PRIMARY KEY
	,nome_completo text
	,email text
	,datahora_ocorrencia timestamp
	,titulo_ocorrencia text
	,resumo_ocorrencia text
	,status_aprovacao boolean
	,imagem text
	,latitude decimal(10, 8)
	,longitude decimal(10, 8)
	,em_aberto boolean
        ,id_tipo integer);

CREATE TABLE tipo_desastre (id serial primary key, nome text);
INSERT INTO tipo_desastre (id, nome) VALUES
(1, 'Inundações'),
(2, 'Deslizamentos'),
(3, 'Secas'),
(4, 'Tempestades'),
(5, 'Queimadas'),
(6, 'Erupção Vulcânica');

ALTER TABLE ocorrencia ADD FOREIGN KEY (id_tipo) REFERENCES tipo_desastre (id);