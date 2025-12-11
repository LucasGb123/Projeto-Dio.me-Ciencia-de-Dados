-- criação do banco de dados para cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(30),
		constraint unique_cpf_client unique (CPF)
);

-- criar tablea produto

-- size = dimensão do produto
create table product(
		idClient int auto_increment primary key,
        Pname varchar(10) not null,
        classification_kids bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos', 'Móveis') not null,
        avaliação float default 0,
        size varchar(10),
		constraint unique_cpf_client unique (CPF)
);

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no esquema relacional
-- criar constraints relacionadas ao pagamento
create table payments(
	idclient int,
	idPayment int,
    typePayment enum('boleto','Cartão','Dois cartões'),
    limitAvailable float,
    primary key(idClient, id_payment)
);


-- criar tabela pedido
create table orders(
		idOrders int auto_increment primary key,
        idOrdersClient int,
        ordersStatus enum('Cancelado', 'Confirmado', 'Em processamento') not null,
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false,
        constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);