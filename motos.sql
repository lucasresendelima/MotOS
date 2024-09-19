create database dbmotos;

use dbmotos;

create table t_usuarios(
id_usuario int primary key,
usuario varchar(50) not null,
telefone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

describe t_usuarios; -- Exibe a tabela.

insert into t_usuarios(id_usuario,usuario,telefone,login,senha) -- Create do CRUD.
values(1,'Lucas Lima','(11) 97070-7070','lucaslima','123');

select * from t_usuarios; -- Exibe os dados da tabela (Read do CRUD).

insert into t_usuarios(id_usuario,usuario,telefone,login,senha)
values(2,'Administrador','(11) 97070-7070','admin','admin');
insert into t_usuarios(id_usuario,usuario,telefone,login,senha)
values(3,'Antônio Carlos','(11) 97070-7070','antoniocarlos','456');

update t_usuarios set telefone='(11) 96329-2126' where id_usuario=3; -- Update do CRUD.

delete from t_usuarios where id_usuario=3; -- Delete do CRUD.

create table t_clientes(
id_cliente int primary key auto_increment, -- "auto_increment" -> insere automaticamente um valor quando um novo registro é criado.
nome_cliente varchar(50) not null,
endereco_cliente varchar(100),
fone_cliente varchar(15) not null,
email_cliente varchar(50)
);

describe t_clientes;

insert into t_clientes(nome_cliente,endereco_cliente,fone_cliente,email_cliente)
values('Linus Torvalds','Rua Helsínquia, 2024','(11) 97070-7070','linus@kernel.org');

select * from t_clientes;

create table t_os(
os int primary key auto_increment,
data_os timestamp default current_timestamp, -- 
equipamento varchar(50) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(50),
valor decimal(10,2), -- Utilizado em valores monetários, onde "10" é o total de caracteres, e "2" o quanto a vírgula se desloca.
id_cliente int not null,
foreign key(id_cliente) references t_clientes(id_cliente)
);

describe t_os;

alter table t_os
rename column equipamento to veiculo,
rename column tecnico to mecanico;

insert into t_os(veiculo,defeito,servico,mecanico,valor,id_cliente)
values('Yamaha Neo AT115 2005','Vazamento de gasolina pelo carburador.','Substituição da agulha e sede da bóia + guarnição da cuba.','Tião',157.23,1);

select * from t_os;

select
O.os,veiculo,defeito,servico,valor, -- Escolhendo o que quer da tabela e armazenando em variáveis.
C.nome_cliente,fone_cliente
from t_os as O
inner join t_clientes as C -- Unindo as tabelas.
on (O.id_cliente = C.id_cliente); -- Chave estrangeira ligada à chave primária.