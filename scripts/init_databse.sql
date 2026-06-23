/*
=============================================================
Create Database and Schemas
=============================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse'
    after checking whether it already exists.

    If the database exists, it is dropped and recreated.
    Additionally, the script creates three schemas within
    the database:

        - bronze
        - silver
        - gold

    These schemas represent the Medallion Architecture
    layers used in modern data warehousing.

WARNING:
    Running this script will permanently delete the existing
    'DataWarehouse' database, including all tables, views,
    stored procedures, and data contained within it.

    Ensure that you have taken appropriate backups before
    executing this script in any environment.
*/

USE master:

GO

-- Drop and recreate the 'Datawarehouse' database
IF Exists (select 1 from sys.databases where name = 'DataWarehouse)
Begin
  Alter Database DataWarehouse set single_user with rollback immediate;
  Drop Database DataWarehouse;
End;
GO

-- Create the 'DataWarehouse' database
Create Database 'DataWarehouse'
GO

USE DataWarehouse
GO

-- Create Schemas
Create schema bronze;
GO

Create schema silver;
GO

Create schema gold;
GO
