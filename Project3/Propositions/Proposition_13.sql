--=================================================================================================--
-- Author:      <Marcus Gale>
-- Create date: <12/5/24>
-- Description: Return the top total enrollment counts for different combinations of course, mode of instruction, 
-- and instructor, ordered by enrollment, excluding NULL values.
--=================================================================================================--

SELECT TOP 50
    CO.CourseID,
    MOI.ModeName,
    I.FirstName,
    SUM(C.Enrollment) AS TotalEnrollment
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
GROUP BY 
    CO.CourseID, MOI.ModeName, I.FirstName
WITH CUBE
HAVING 
    SUM(C.Enrollment) < 50   -- Apply a condition for total enrollment
    AND CO.CourseID IS NOT NULL
    AND MOI.ModeName IS NOT NULL
    AND I.FirstName IS NOT NULL
ORDER BY 
    TotalEnrollment DESC;
