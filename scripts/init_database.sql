/*
============================================================
Create Database and Schemas
============================================================
Script Purpose:
	This script creates a new database named 'DataWarehouse' after checking if it already exists.
	if the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	within the databse: 'bronze', 'silver' and 'gold'.

WARNING:
	Running this script will drop the entire 'DataWarehouse' databse if it exists.
	All data in the database will be permanently deleted. Processed with caution
	and ensure you have proper backups before running this script.
*/

-- Create Database 'DataWarehouse'

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

-- Switch to database
USE DataWarehouse;


-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO