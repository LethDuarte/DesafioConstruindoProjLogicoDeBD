-- criação de banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce;

USE ecommerce;

-- criação tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Fname VARCHAR(10) NOT NULL,
    Minit CHAR(3),
    Lname VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    RG VARCHAR(10) NOT NULL,
    Street VARCHAR(25) NOT NULL,
    Compl VARCHAR(25),
    District VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State VARCHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
    BirthDate DATE,
    Email VARCHAR(50),
    CONSTRAINT unique_cpf_clients UNIQUE(CPF)
);

ALTER TABLE clients AUTO_INCREMENT=1;

-- criação tabela produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ProdName VARCHAR(25) NOT NULL,
    Category VARCHAR(15) NOT NULL,
    Descript VARCHAR(25),
    Rating FLOAT DEFAULT 0,
    Price FLOAT NOT NULL
);

-- criação tabela pedido Obs: 'freight = frete', 'value overall = valor total', 
CREATE TABLE request (
	idRequest INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Request_idClient INT,
    StatusRequest ENUM ('Em andamento', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Em andamento',
    Descript VARCHAR(25),
    Freight FLOAT DEFAULT 10,
    ValueProduct FLOAT,
    ValueOverall FLOAT,
    QuantProd INT,
    PaymentCash BOOL DEFAULT FALSE
    CONSTRAINT fk_request_clients FOREIGN KEY (Request_idClient) REFERENCES clients(idClient)
);

-- Alterando tabela 'request'
-- ALTER TABLE request DROP CONSTRAINT fk_request_clients;
-- ALTER TABLE request ADD CONSTRAINT fk_request_clients FOREIGN KEY (Request_idClient) REFERENCES clients(idClient) ON UPDATE CASCADE;


-- criação tabela pagamento
CREATE TABLE payment(
	idClient INT,
    idPayment INT NOT NULL,
    TypePayment ENUM('Credito', 'Credito 2c', 'Debito', 'Boleto'),
    LimitAvaible FLOAT,
    StatusPayment ENUM ('Realizado', 'Em Processamento', 'Negado'),
    PRIMARY KEY (idClient, idPayment)
);

-- criação tabela estoque
CREATE TABLE stock(
	idStock INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Street VARCHAR(25) NOT NULL,
    Compl VARCHAR(25),
    District VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State CHAR(2) NOT NULL,
    CEP CHAR(8),
    QuantProd INT NOT NULL DEFAULT 0,
    CreateDate DATE
);

-- criação tabela fornecedor
CREATE TABLE provider(
	idProvider INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CNPJ CHAR(14),
    ProvRealName VARCHAR(25),
    ProvFantasy VARCHAR(25),
    Street VARCHAR(25) NOT NULL,
    Compl VARCHAR(25),
    District VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State CHAR(2) NOT NULL,
    CEP CHAR(8),
    Contact VARCHAR(45),
    CreateDate DATE,
    CONSTRAINT unique_provider_cnpj UNIQUE(CNPJ),
    CONSTRAINT unique_provider_realName UNIQUE(ProvRealName)
);

-- criação tabela Terceiro_Vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CNPJ CHAR(14) NOT NULL,
    CPF CHAR(11) NOT NULL,
    SellerRealName VARCHAR(25) NOT NULL,
    SellerFantasy VARCHAR(25),
    Street VARCHAR(25) NOT NULL,
    Compl VARCHAR(25),
    District VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State CHAR(2) NOT NULL,
    CEP CHAR(8),
    AssociateDate DATE,
    CreateDate DATE,
    Contact VARCHAR(45),
    CONSTRAINT unique_vendor_cnpj UNIQUE(CNPJ),
    CONSTRAINT unique_vendor_cpf UNIQUE(CPF)
);

-- criação tabela de relacionamento Produto e TerceiroVendedor (TerceiroVendedor tem Produto)
CREATE TABLE productSeller(
	idProdSeller INT,
    idProdProduct INT,
    ProdQuant INT DEFAULT 1,
    PRIMARY KEY (idProdSeller, idProdProduct),
    CONSTRAINT fk_productSeller_seller FOREIGN KEY (idProdSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_productSeller_product FOREIGN KEY (idProdProduct) REFERENCES product(idProduct)
);

DESC productSeller;

-- criação tabela de relacionamento Produto e Pedido (Pedido tem Produto)
CREATE TABLE productRequest(
	idPR_Product INT,
    idPR_Request INT,
    PRQuantity INT,
    PRStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPR_Product , idPR_Request),
    CONSTRAINT fk_productRequest_product FOREIGN KEY (idPR_Product) REFERENCES product(idProduct),
    CONSTRAINT fk_productRequest_request FOREIGN KEY (idPR_Request) REFERENCES request(idRequest)
);

-- criação tabela de relacionamento Produto e Estoque (Estoque tem Produto)
CREATE TABLE productStock(
	idPS_Product INT,
    idPS_Stock INT,
    ProdQuant INT DEFAULT 0,
    PRIMARY KEY (idPS_Product, idPS_Stock),
    CONSTRAINT fk_productStock_product FOREIGN KEY (idPS_Product) REFERENCES product(idProduct),
    CONSTRAINT fk_productStock_stock FOREIGN KEY (idPS_Stock) REFERENCES stock(idStock)
);

-- criação tabela de relacionamento Produto e Fornecedor
CREATE TABLE productProvider(
	idPP_Product INT,
    idPP_Provider INT,
    ProdQuant INT DEFAULT 0,
    CONSTRAINT fk_productProvider_product FOREIGN KEY (idPP_Product) REFERENCES product(idProduct),
    CONSTRAINT fk_productProvider_provider FOREIGN KEY (idPP_Provider) REFERENCES provider(idProvider)
);

-- conferindo tabelas do banco de dados
SHOW TABLES;

-- conferindo schemas
USE information_schema;
SHOW TABLES;

SELECT * FROM referential_constraints WHERE constraint_schema = 'ecommerce';


