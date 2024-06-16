create database bancocalamidade;

create table usuarios(id serial primary key, usuario text, senha text, email text);
insert into usuarios('admin', 'admin', 'admin@gmail.com');

create table ocorrencia(id serial primary key, nome_completo text, email text, datahora_ocorrencia timestamp, titulo_ocorrencia text, resumo_ocorrencia text, status_aprovacao boolean, local text);
