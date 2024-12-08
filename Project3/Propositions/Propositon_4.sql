-- =================================================================================================================
-- Author:		<Heidi Luna>
-- Create date: <12/5/2024>
-- Description: Show information about all classes offered , including class code, section, time, 
-- instructor name, days, enrollment limit, current enrollment, and mode of instruction (e.g., in-person or online
-- =================================================================================================================  

USE QueensClassSchedule;
SELECT
    Cl.ClassCode,
    Cl.Section AS SectionCode,
    Cl.Time AS ClassTime,
    I.FullName AS InstructorName,
    Cl.Days,
    Cl.Limit,
     Cl.Enrollment AS CurrentEnrollment,
    MoI.ModeName AS ModeOfInstruction
FROM
    Course.Class Cl
LEFT JOIN
    Department.Instructor I ON Cl.InstructorID = I.InstructorID
INNER JOIN
    Course.CoursesClassMode CCM ON Cl.ClassID = CCM.ClassID
INNER JOIN
    Course.Mode_Of_Instruction MoI ON CCM.ModeID = MoI.ModeID
ORDER BY
    Cl.ClassCode;

