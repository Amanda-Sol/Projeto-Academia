
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS academia;
USE academia;

-- Tabela Aluno
CREATE TABLE Aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_nascimento DATE,
    endereco VARCHAR(200)
);

-- Tabela Plano
CREATE TABLE Plano (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,   -- Ex: Mensal, Trimestral, Anual
    descricao VARCHAR(100),
    preco DECIMAL(10, 2) NOT NULL,
    duracao_meses INT NOT NULL    -- Quantidade de meses do plano
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    plano_id INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(50),   -- Ex: Dinheiro, Cartão, PIX
    status VARCHAR(20) DEFAULT 'Pago', -- Pago, Pendente, Cancelado

    FOREIGN KEY (aluno_id) REFERENCES Aluno(id) ON DELETE CASCADE,
    FOREIGN KEY (plano_id) REFERENCES Plano(id) ON DELETE CASCADE
);
