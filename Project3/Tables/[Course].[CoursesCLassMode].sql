SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsering Wangyal Bista Lowa>
-- Create date: <12/1/2024>
-- Description:	<Creating the CoursesCLassMode Table>
-- =============================================
CREATE TABLE [Course].[CoursesCLassMode](
	[CourseId] [Udt].[SurrogateKeyInt] NOT NULL,
	[ClassID] [Udt].[SurrogateKeyInt] NOT NULL,
	[ModeID] [Udt].[SurrogateKeyInt] NOT NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NULL,
	[DateAdded] [Udt].[DateAdded] NULL,
	[DateOfLastUpdate] [Udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Course].[CoursesCLassMode] ADD PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[CourseId] ASC,
	[ModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Course].[CoursesCLassMode] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[CoursesCLassMode] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [ClassId] FOREIGN KEY([ClassID])
REFERENCES [Course].[Class] ([ClassID])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [ClassId]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [CourseId] FOREIGN KEY([CourseId])
REFERENCES [Course].[Course] ([CourseID])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [CourseId]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [FK_CourseBridge_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [FK_CourseBridge_UserAuthorizationKey]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [ModeId] FOREIGN KEY([ModeID])
REFERENCES [Course].[Mode_Of_Instruction] ([ModeID])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [ModeId]
GO
