SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Marcus Gale>
-- Create date: <12/1/2024>
-- Description:	<Creating the Room WorkflowSteps Table>
-- =============================================
CREATE TABLE [process].[WorkflowSteps](
	[WorkflowStepsKey] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[WorkflowStepsDescription] [Udt].[WorkFlowString] NOT NULL,
	[WorkflowStepsTableRowCount] [Udt].[RowCount] NULL,
	[StartingDateTime] [Udt].[DateAdded] NULL,
	[EndDateTime] [Udt].[DateAdded] NULL,
	[ClassTime] [Udt].[ClassTime] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [process].[WorkflowSteps] ADD PRIMARY KEY CLUSTERED 
(
	[WorkflowStepsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT ((0)) FOR [WorkflowStepsTableRowCount]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [StartingDateTime]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [EndDateTime]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT ('10:45') FOR [ClassTime]
GO
