--=================================================================================================--
-- Author:      <Marcus Gale>
-- Create date: <12/5/24>
-- Description: Return the unique class (ClassID) with the smallest enrollment, for 
-- every instructor (FirstName) with at least one class where Enrollment < 50.
--=================================================================================================--
WITH UniqueInstructors AS (
    SELECT 
        C.ClassID,
        CO.CourseID,
        I.FirstName,
        MOI.ModeName,
        C.Enrollment,
        ROW_NUMBER() OVER (PARTITION BY I.FirstName ORDER BY C.Enrollment ASC) AS RowNum
    FROM 
        QueensClassSchedule.Course.Class AS C
    JOIN 
        QueensClassSchedule.Course.Course AS CO ON C.ClassID = CO.CourseID
    JOIN 
        QueensClassSchedule.Course.CoursesCLassMode AS CCM ON CO.CourseID = CCM.CourseId
    JOIN 
        QueensClassSchedule.Course.Mode_Of_Instruction AS MOI ON CCM.ModeID = MOI.ModeID
    LEFT JOIN 
        QueensClassSchedule.Department.Instructor AS I ON C.InstructorID = I.InstructorID
    WHERE 
        C.Enrollment < 50
)
SELECT DISTINCT 
    ClassID,
    CourseID,
    FirstName,
    ModeName,
    Enrollment
FROM 
    UniqueInstructors
WHERE 
    RowNum = 1
ORDER BY 
    Enrollment ASC;
