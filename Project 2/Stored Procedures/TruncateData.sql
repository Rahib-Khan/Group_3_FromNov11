SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tsering Wangyal Bista Lowa
-- Create date: 11/13/24
-- Description:	Delete all data from Star Schema
-- =============================================
ALTER PROCEDURE [Project2].[TruncateStarSchemaData]
    @UserAuthorizationKey int

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;


    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    DECLARE @StartingDateTime DATETIME2 = SYSDATETIME();

    TRUNCATE TABLE [CH01-01-Dimension].DimCustomer;
    ALTER SEQUENCE PkSequence.DimCustomerSequence RESTART WITH 1;
    TRUNCATE TABLE [CH01-01-Dimension].DimGender;
    TRUNCATE TABLE [CH01-01-Dimension].DimMaritalStatus;
    TRUNCATE TABLE [CH01-01-Dimension].DimOccupation;
    ALTER SEQUENCE PkSequence.DimOccupationSequence RESTART WITH 1;
    TRUNCATE TABLE [CH01-01-Dimension].DimOrderDate;
    TRUNCATE TABLE [CH01-01-Dimension].DimProduct;
    ALTER SEQUENCE PkSequence.DimProductSequence RESTART WITH 1;
    TRUNCATE TABLE [CH01-01-Dimension].DimProductCategory;
    ALTER SEQUENCE PkSequence.DimProductCategorySequence RESTART WITH 1;
    TRUNCATE TABLE [CH01-01-Dimension].DimProductSubCategory;
    ALTER SEQUENCE PkSequence.DimProductSubCategorySequence RESTART WITH 1;
    TRUNCATE TABLE [CH01-01-Dimension].DimTerritory;
    ALTER SEQUENCE PkSequence.DimTerritorySequence RESTART WITH 1;
    TRUNCATE TABLE [CH01-01-Dimension].SalesManagers;
    ALTER SEQUENCE PkSequence.SalesManagersSequence RESTART WITH 1;
    TRUNCATE TABLE [CH01-01-Fact].Data;
    ALTER SEQUENCE PkSequence.DataSequence RESTART WITH 1;
    --TRUNCATE table [Process].[WorkflowSteps]
    --ALTER SEQUENCE PkSequence.WorkFlowStepsSequence RESTART WITH 1

    DECLARE @WorkFlowStepTableRowCount INT;
    SET @WorkFlowStepTableRowCount = 0;
    DECLARE @EndingDateTime DATETIME2 = SYSDATETIME();
    EXEC [Process].[usp_TrackWorkFlow] 'Truncate Data',
                                       @WorkFlowStepTableRowCount,
                                       @StartingDateTime,
                                       @EndingDateTime,
                                       @UserAuthorizationKey;
end
GO
