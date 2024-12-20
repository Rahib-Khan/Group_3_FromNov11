SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Marcus Gale>
-- Create date: <12/1/2024>
-- Description:	<Tracking the workflow steps>
-- =============================================
ALTER PROCEDURE [Project3].[TrackWorkFlow]

    @UserAuthorizationKey INT,
    @WorkFlowStepsDescription NVARCHAR(100),
    @WorkflowStepsTableRowCount INT

AS
BEGIN

    INSERT INTO Process.WorkFlowSteps
        (WorkflowStepsDescription, UserAuthorizationKey, WorkflowStepsTableRowCount)
    VALUES(@WorkFlowStepsDescription, @UserAuthorizationKey, @WorkflowStepsTableRowCount);


END
GO
