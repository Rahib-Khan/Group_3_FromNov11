SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsering Wangyal Bista Lowa>
-- Create date: <12/1/2024>
-- Description:	<Create Department table>
-- =============================================
CREATE TABLE [Department].[Departments](
	[DepartmentID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[DepartmentAbv] [Udt].[SurrogateKeyString] NULL,
	[DepartmentName] [Udt].[WorkFlowString] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NULL,
	[DateAdded] [Udt].[DateAdded] NULL,
	[DateOfLastUpdate] [Udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Department].[Departments] ADD PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Department].[Departments] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Department].[Departments] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Department].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Department_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Department].[Departments] CHECK CONSTRAINT [FK_Department_UserAuthorizationKey]
GO
