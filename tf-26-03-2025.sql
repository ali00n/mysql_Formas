
CREATE DATABASE ClienteUsuario;


CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);


CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL
);


CREATE OR REPLACE FUNCTION inserir_cliente(
    p_nome VARCHAR, 
    p_telefone VARCHAR
) RETURNS VOID AS $$
BEGIN
    INSERT INTO cliente (nome, telefone) VALUES (p_nome, p_telefone);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION atualizar_cliente(
    p_id INT, 
    p_nome VARCHAR, 
    p_telefone VARCHAR
) RETURNS VOID AS $$
BEGIN
    UPDATE cliente SET nome = p_nome, telefone = p_telefone WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION deletar_cliente(
    p_id INT
) RETURNS VOID AS $$
BEGIN
    DELETE FROM cliente WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION selecionar_clientes()
RETURNS TABLE (id INT, nome VARCHAR, telefone VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT * FROM cliente;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION inserir_usuario(
    p_nome VARCHAR, 
    p_senha VARCHAR
) RETURNS VOID AS $$
BEGIN
    INSERT INTO usuario (nome, senha) VALUES (p_nome, p_senha);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION atualizar_usuario(
    p_id INT, 
    p_nome VARCHAR, 
    p_senha VARCHAR
) RETURNS VOID AS $$
BEGIN
    UPDATE usuario SET nome = p_nome, senha = p_senha WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION deletar_usuario(
    p_id INT
) RETURNS VOID AS $$
BEGIN
    DELETE FROM usuario WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION selecionar_usuarios()
RETURNS TABLE (id INT, nome VARCHAR, senha VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT * FROM usuario;
END;
$$ LANGUAGE plpgsql;


SELECT inserir_cliente('Alisson', '11999999999');


SELECT inserir_usuario('Alisson', 'abc123');


SELECT * FROM selecionar_clientes();


SELECT * FROM selecionar_usuarios();
