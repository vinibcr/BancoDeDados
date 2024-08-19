create database ProjetoBD; 
use projetobd;

create table Pessoa (
    CPF varchar(11) not null primary key,
    nome varchar(10) not null 
    );
select * from veiculo;    
ALTER TABLE veiculo
drop COLUMN placa ;

update Pessoa
set nome = 'Carla' 
where  cpf = '68885577598';

#values ('42555555735', 'Carlos');
#values ('54213658484', 'Julia');
#values ('45876897554', 'Fernanda');
#values ('68885577598', 'Carla');


insert into 
Pessoa (CPF, nome)

values ('12312312358', 'vinicius');
#values ('42324454884', 'Eduardo');
#values ('42544877251', 'Gustavo');
#values ('85424475254', 'Pedro');
#values ('14428254474', 'Paulo');
#values ('15424479554', 'Josue');
#values ('16498475254', 'Kleber');


create table cliente (
	CPF_indicado varchar (11) not null,
    CPF_cliente varchar (11) primary key not null,
    Telefone varchar (11) not null,
    FOREIGN KEY (CPF_cliente) REFERENCES Pessoa(CPF) );
    
insert into 
Cliente (CPF_cliente, CPF_indicado, telefone)
#values ('12312312358', '12336554285', '11926265859');
#values ('42324454884', '18536554285', '15858585858');
#values ('42544877251', '18965554285', '14925255484');
#values ('85424475254', '02336824975', '12985775257');
    
create table Funcionario (
    CPF varchar (11) primary key not null,
    Cargo text (11) not null,
    Foreign key (cpf) references Pessoa(CPF) );
 
insert into
Funcionario (cpf, cargo)
#values ('42555555735', 'vendedor');
#values ('54213658484', 'gerente');
#values ('45876897554', 'recepcionista');
#values ('68885577598', 'supervisor');

create table veiculo (
    Placa varchar (11) primary key not null,
    Tipo text (11) not null,
    Crv varchar (11) unique not null
    );
    
    insert into 
    veiculo (placa, Tipo, Crv)
    #values ('bra-1578', 'Automovel', '32132132154');
    #values ('brb-4185', 'Bonde', '84584596525');
    #values ('trs-7589', 'Caminhão', '09887635609');
    #values ('rod-8627', 'Caminhonete', '00577899834')
    #values ('pop-8275', 'Automovel', '54298675484');
    
    values ('toi-7849', 'Automovel', '09887635609');
    values ('oid-8547', 'Caminhonete', '00577899834');
    values ('pye-8955', 'Automovel', '54298675484');
    
    
    
Create table aluga (
	Placa varchar (11) not null,
    CPF varchar (11) not null,
    primary key (cpf, placa),
    foreign key (cpf) references cliente (cpf_cliente),
    foreign key (placa) references veiculo (placa)
    );
    
    insert into 
    Aluga (Placa, CPF)
    #values ('bra-1578', '12312312358');
    #values ('brb-4185', '42324454884');
    #values ('trs-7589', '42544877251');
    #values ('rod-8627', '85424475254');

    
create table aluguel (
	Placa varchar (11) not null,
    CPF varchar (11) not null,
    data_Aluguel date,
    primary key (cpf, placa, data_Aluguel),
    foreign key (cpf) references aluga (cpf),
    foreign key (placa) references aluga (placa)
    );
    
    drop table aluguel;
    
    insert into
    Aluguel ( Placa, CPF, data_Aluguel)
    #values ('bra-1578', '12312312358', 17/11/2021 );
    #values ('brb-4185', '42324454884', 16/06/2022);
    #values ('trs-7589', '42544877251', 25/12/2021);
    #values ('rod-8627', '85424475254', 27/08/2019);
    
    select * from aluga;
    
Create table Encarregado (
	CPF varchar (11) not null,
    data_Aluguel date,
    primary key ( CPF, data_Aluguel),
    foreign key (CPF) references funcionario (CPF),
    foreign key (data_Aluguel) references aluguel (data_Aluguel)
    );
drop table encarregado;
show full columns from encarregado;

    insert into encarregado ( cpf, data_Aluguel)
    values ('42555555735', 17/11/2021);
    values ('54213658484', 16/06/2022);
    values ('45876897554', 25/12/2021);
    values ('68885577598', 27/08/2019);
    
create table pertence (
	Placa varchar (11) not null,
    cnpj varchar (18)  not null,
    primary key (placa, cnpj),
    foreign key (placa) references veiculo (placa),
    foreign key (cnpj) references concessionaria (cnpj)
    );

drop table pertence;

insert into pertence ( Placa, cnpj )   
    values ('bra-1578', '45.452.333/0001-14');
    #values ('brb-4185', '51.847.542/2024-54');
    #values ('trs-7589', '57.577.098/5457-68');
    #values ('rod-8627', '58.767.098/3598-87');
    
    
create table concessionaria (
    cnpj varchar (18) primary key not null,
    nome text (11) not null,
    endereco varchar (20) not null
    );
    
drop table concessionaria;
    
insert into concessionaria (cnpj, nome, endereco)
    #values ('45.452.333/0001-14', 'Maps', ' E. Victoria St 35');
    #values ('51.847.542/2024-54', 'Mouras', 'Los Patos Way 451');
    #values ('57.577.098/5457-68', 'Fiat', ' De la Vina St 572');
    #values ('58.767.098/3598-87', 'Honda', 'Rich Sanches 24');
    
create table trabalha(
	cnpj varchar (18) not null,
    CPF varchar (11)  not null,
    primary key (cnpj, cpf),
    foreign key (cpf) references funcionario (cpf),
    foreign key (cnpj) references concessionaria (cnpj)
    );


drop table trabalha;

insert into trabalha (cnpj, cpf)
	#values ('45.452.333/0001-14', '42555555735');
    #values ('51.847.542/2024-54', '54213658484');
    #values ('57.577.098/5457-68', '45876897554');
	#values ('58.767.098/3598-87', '68885577598');

select concessionaria.nome, veiculo.tipo, veiculo.placa
from concessionaria, veiculo, pertence
where 
        veiculo.placa = pertence.placa and
        concessionaria.cnpj = pertence. cnpj and
        veiculo.tipo = 'Bonde';
        

select concessionaria.nome, veiculo.tipo, veiculo.placa
from concessionaria, veiculo, pertence
where 
        veiculo.placa = pertence.placa and
        concessionaria.cnpj = pertence. cnpj and
        veiculo.tipo = 'Bonde';
        
select * from pertence;
select * from veiculo;
select * from concessionaria;
select * from aluga;
set foreign_key_checks = 0;
SET FOREIGN_KEY_CHECKS=1;
update veiculo set placa = 'bra-2000' where placa = 'bra-1578' ;