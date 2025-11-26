/*
------------------------------------
Criação do Banco de Dados e Esquemas
------------------------------------

Esse Script cria um novo banco de dados com o nome 'DataWarehouse' depois de checar se o mesmo já existe.
Caso ele exista, será apagado e recriado. O script também gera os esquemas, 'bronze', 'prata' e 'ouro'.

AVISO:
	Esse script apagará todos os dados contidos no banco de dados caso ele já exista, use com cautela.


*/

USE master;
GO

-- Apagar e recriar banco de dados 'DataWarehouse'

IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
  BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
  END;
GO

-- Criar Banco de Dados 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Criar Esquemas

CREATE SCHEMA bronze;
GO

CREATE SCHEMA prata;
GO

CREATE SCHEMA ouro;
GO
