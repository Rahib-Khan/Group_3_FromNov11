SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsering Wangyal Bista Lowa>
-- Create date: <12/1/2024>
-- Description:	<Creating the Class Table>
-- =============================================
CREATE TABLE [Course].[Class](
	[ClassID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[Enrollment] [Udt].[SurrogateKeyInt] NULL,
	[Limit] [Udt].[SurrogateKeyInt] NULL,
	[Section] [Udt].[SurrogateKeyString] NULL,
	[ClassCode] [Udt].[SurrogateKeyString] NULL,
	[Days] [Udt].[SurrogateKeyString] NULL,
	[Time] [Udt].[ClassDuration] NULL,
	[Hours] [Udt].[SurrogateKeyFloat] NULL,
	[Credits] [Udt].[SurrogateKeyInt] NULL,
	[InstructorID] [Udt].[SurrogateKeyInt] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NULL,
	[DateAdded] [Udt].[DateAdded] NULL,
	[DateOfLastUpdate] [Udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Course].[Class] ADD PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Course].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Course].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Course].[Class] CHECK CONSTRAINT [FK_Class_UserAuthorizationKey]
GO
ALTER TABLE [Course].[Class]  WITH CHECK ADD  CONSTRAINT [InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [Department].[Instructor] ([InstructorID])
GO
ALTER TABLE [Course].[Class] CHECK CONSTRAINT [InstructorID]
GO
