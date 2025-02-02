-- Select Query Temporal Tables

SELECT * FROM Employee
  FOR SYSTEM_TIME
    BETWEEN '2021-01-01 00:00:00.0000000' AND '2022-01-01 00:00:00.0000000';

SELECT * FROM Employee
  FOR SYSTEM_TIME ALL;


 SELECT * FROM Employee
  FOR SYSTEM_TIME
    FROM '2021-01-01 00:00:00.0000000' TO '2022-01-01 00:00:00.0000000';

SELECT * FROM Employee
  FOR SYSTEM_TIME
    AS OF '2021-01-01 00:00:00.0000000';

SELECT * FROM Employee
  FOR SYSTEM_TIME
    CONTAINED IN ('2021-01-01 00:00:00.0000000', '2022-01-01 00:00:00.0000000');

-- Create Temporal Tables

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistory), DURABILITY = SCHEMA_ONLY );
;
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH (FILETABLE_PRIMARY_KEY_CONSTRAINT_NAME = COLUMNC );
;
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH (DATA_DELETION = ON (FILTER_COLUMN = ColumnC, RETENTION_PERIOD = INFINITE));
;
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH
(
    MEMORY_OPTIMIZED = ON,
    DURABILITY = SCHEMA_AND_DATA,
    SYSTEM_VERSIONING = ON (HISTORY_TABLE = History.DepartmentHistory)
);
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH
(
    REMOTE_DATA_ARCHIVE = OFF ( MIGRATION_STATE = PAUSED ),
    LEDGER = ON (LEDGER_VIEW = dbo.ABC (TRANSACTION_ID_COLUMN_NAME = [ColumnC], SEQUENCE_NUMBER_COLUMN_NAME = [ColumnDecimal]))
);
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH
(
    DATA_COMPRESSION = ROW
    XML_COMPRESSION = ON ON PARTITIONS (2)
);
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH
(
    DATA_COMPRESSION = PAGE ON PARTITIONS (3, 5)
    XML_COMPRESSION = OFF
);
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH
(
    XML_COMPRESSION = ON ON PARTITIONS (3 TO 5),
    FILETABLE_DIRECTORY = '/path1/path2',
    FILETABLE_COLLATE_FILENAME = constraint1,
    FILETABLE_PRIMARY_KEY_CONSTRAINT_NAME = constraint2,
    FILETABLE_STREAMID_UNIQUE_CONSTRAINT_NAME = constraint3,
    FILETABLE_FULLPATH_UNIQUE_CONSTRAINT_NAME = constraint4
);
GO

CREATE TABLE [dbo].[EC DC] (
    [Column B] [varchar](100),
    [ColumnC] varchar(100),
    [ColumnDecimal] decimal(10,3)
)
WITH
(
    REMOTE_DATA_ARCHIVE = ON ( FILTER_PREDICATE = NULL, MIGRATION_STATE = OUTBOUND),
    LEDGER = ON (LEDGER_VIEW = dbo.ABC, APPEND_ONLY = ON)
);
GO
