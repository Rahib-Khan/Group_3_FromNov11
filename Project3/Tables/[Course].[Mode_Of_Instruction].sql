SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Heidi Luna Vicuna>
-- Create date: <12/11/2024>
-- Description:	<Creating the Mode Of Instruction Table>
-- =============================================
CREATE TABLE [Course].[Mode_Of_Instruction](
	[ModeID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[ModeName] [Udt].[WorkFlowString] NOT NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NULL,
	[DateAdded] [Udt].[DateAdded] NULL,
	[DateOfLastUpdate] [Udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Course].[Mode_Of_Instruction] ADD PRIMARY KEY CLUSTERED 
(
	[ModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Course].[Mode_Of_Instruction] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[Mode_Of_Instruction] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Course].[Mode_Of_Instruction]  WITH CHECK ADD  CONSTRAINT [FK_MOI_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Course].[Mode_Of_Instruction] CHECK CONSTRAINT [FK_MOI_UserAuthorizationKey]
GO
