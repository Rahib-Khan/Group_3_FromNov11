
-- =============================================
-- Author:		<Rahib>
-- Create date: <12/5/2024>
-- Description:	<Creating the User Defined Datatypes >
-- =============================================

-- Created [Udt] Schema
CREATE SCHEMA [Udt];

-- Created for all PKs and FKs and definite integer values in QCS db Adding datatype for ID values in all tables
CREATE TYPE [Udt].[SurrogateKeyInt] FROM [int] NULL

-- Created for [Process].[WorkFlowSteps] & [DbSecurity].[UserAuthorization]  to add a datatype for StartingDateTime/EndDateTime Attribute 
CREATE TYPE [Udt].[DateAdded] FROM Datetime2(7) NOT NULL

-- Created for [Process].[WorkFlowSteps] & [DbSecurity].[UserAuthorization]  to add a datatype for ClassTime Attribute
CREATE TYPE [Udt].[ClassTime] FROM nchar(6) NOT NULL

-- Created for [DbSecurity].[UserAuthorization]  to add a datatype for IndividualProject Attribute
CREATE TYPE [Udt].[IndividualProject] FROM nvarchar (60) NOT NULL

-- Created for [Process].[WorkFlowSteps] & [DbSecurity].[UserAuthorization]  to add a datatype for all name related attributes
CREATE TYPE [Udt].[LastName] FROM nvarchar(35) NOT NULL
CREATE TYPE [Udt].[FirstName] FROM nvarchar(30) NOT NULL
CREATE TYPE [Udt].[GroupName] FROM nvarchar(30) NOT NULL


-- Created for [Process].[WorkflowSteps] Line 81 Adding datatype for WorkFlowStepsDescription in WorkFlowSteps Table 
CREATE TYPE [Udt].[WorkFlowString] from NVARCHAR(100) not null

-- Created for [Process].[WorkflowSteps] to add a datatype for WorkFlowStepsTableRowCount in WorkFlowSteps Table
CREATE TYPE [Udt].[RowCount] from [int] not null

--Created for [Course].[Course]  to add a datatype for Section in Course Table	
CREATE TYPE [Udt].[SurrogateKeyString] from NVARCHAR(30) not null

--Created for [Course].[Class]  to add a datatype for Time in Class Table
CREATE TYPE [Udt].[ClassDuration] FROM NVARCHAR(30) NOT NULL;

--Created for [Course].[Class]  to add a datatype for Hours in Class Table
create type [Udt].[SurrogateKeyFloat] from FLOAT not null


