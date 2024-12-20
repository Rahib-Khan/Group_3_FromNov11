SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Almas Haque>
-- Create date: <12/1/2024>
-- Description:	<Loading data into Building Location Table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_BuildingLocation]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;


    insert into [Location].BuildingLocation
        (BuildingLocationAbv,BuildingLocationName, UserAuthorizationKey)
    select distinct(SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1))),
        case (SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1)))
            when 'IB' then 'I Building'
            when 'GC' then 'Gertz Center'
            when 'QH' then 'Queens Hall'
            when 'SU' then 'Student Union'
            when 'RA' then 'Rathhaus Hall'
            when 'MU' then 'Music Building'
            when 'KY' then 'Keily Hall'
            when 'RZ' then 'Razran Hall'
            when 'SB' then 'Science Building'
            when 'CH' then 'Colwin Hall'
            when 'HH' then 'Honors Hall'
            when 'AR' then 'Alumni Hall'
            when 'DY' then 'Delany Hall'
            when 'PH' then 'Powdermaker Hall'
            when 'RO' then 'Rosenthal Library'
            when 'FG' then 'FitzGerald Gym'
            when 'CD' then 'Colden Auditorium'
            when 'KG' then 'King Hall'
            when 'JH' then 'Jefferson Hall'
            when 'RE' then 'Remsen Hall'
            when 'KP' then 'Klapper Hall'
            when 'GT' then 'Goldstein Theatre'
            when 'GB' then 'G Building'
            else 'Unknown'
        end as Building,
        @UserAuthorizationKey
    from uploadfile.CurrentSemesterCourseOfferings

    SELECT *
    from [Location].BuildingLocation


    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into BuildingLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

END;
GO
