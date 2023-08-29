-- Criação do banco de dados para a oficina
CREATE DATABASE oficina;

-- Usar o banco de dados
USE oficina;

-- Criação das tabelas
CREATE TABLE Oficina (
    idOficina INT AUTO_INCREMENT PRIMARY KEY,
    NomeOficina VARCHAR(255),
    Endereco VARCHAR(255),
    Telefone CHAR(11)
);

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    NomeCliente VARCHAR(255),
    CPF CHAR(11),
    Telefone CHAR(11)
);

CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Marca VARCHAR(255),
    Modelo VARCHAR(255),
    Ano INT,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE OrdemServico (
    idOrdemServico INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idVeiculo INT,
    DataAbertura DATE,
    DescricaoProblema TEXT,
    Status VARCHAR(255),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Exemplos de Consultas:

-- Recuperação simples com SELECT Statement:
SELECT * FROM Cliente;

-- Filtros com WHERE Statement:
SELECT * FROM Veiculo WHERE Marca = '...'; -- nome da marca a ser adicionada

-- Expressões para gerar atributos derivados:
SELECT NomeCliente, CONCAT('CPF: ', CPF) AS InfoCliente FROM Cliente;

-- Ordenação dos dados com ORDER BY:
SELECT * FROM Veiculo ORDER BY Ano DESC;

-- Condições de filtros aos grupos – HAVING Statement:
SELECT Marca, COUNT(*) AS Quantidade FROM Veiculo GROUP BY Marca HAVING COUNT(*) > 2;

-- Junções entre tabelas para perspectiva mais complexa dos dados:
SELECT c.NomeCliente, v.Marca, v.Modelo
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente;