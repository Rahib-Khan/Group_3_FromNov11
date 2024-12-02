SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Heidi Luna Vicuna>
-- Create date: <12/11/2024>
-- Description:	<Creating the Instructor table>
-- =============================================
CREATE TABLE [Department].[Instructor](
	[InstructorID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[FirstName] [Udt].[WorkFlowString] NULL,
	[LastName] [Udt].[WorkFlowString] NULL,
	[FullName] [Udt].[WorkFlowString] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NULL,
	[DateAdded] [Udt].[DateAdded] NULL,
	[DateOfLastUpdate] [Udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Department].[Instructor] ADD PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Department].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Department].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Department].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Department].[Instructor] CHECK CONSTRAINT [FK_Instructor_UserAuthorizationKey]
GO
