--showing all tables in one specific database
SELECT 
    DB_NAME(),
    TABLE_NAME 
FROM 
    INFORMATION_SCHEMA.TABLES 
WHERE 
    TABLE_TYPE = 'BASE TABLE';
	select * from sys.tables


--showing all databases and tables within them
DECLARE @SQL NVARCHAR(MAX) = '';
SELECT @SQL = @SQL + 
'USE [' + name + ']; 
SELECT ''' + name + ''' AS DatabaseName, name AS TableName FROM sys.tables; ' 
FROM sys.databases
WHERE state_desc = 'ONLINE'; 

EXEC sp_executesql @SQL;