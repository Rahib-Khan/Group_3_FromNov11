-- =================================================================================================================
-- Author:		<Heidi Luna>
-- Create date: <12/5/2024>
-- Description: Returns a summary of classes that have met or exceeded their enrollment limit for each day of the week,
-- including the number of such classes, total enrollment, and total enrollment limit.
-- =================================================================================================================  



USE QueensClassSchedule;
SELECT
    Cl.Days,
    COUNT(Cl.ClassCode) AS NumberOfClasses,
    SUM(Cl.Enrollment) AS TotalEnrollment,
    SUM(Cl.Limit) AS TotalLimit
FROM
    Course.Class Cl
LEFT JOIN
    Department.Instructor I ON Cl.InstructorID = I.InstructorID
WHERE
    Cl.Enrollment >= Cl.Limit
GROUP BY
    Cl.Days
ORDER BY
    CASE 
        WHEN Cl.Days = 'Monday' THEN 1
        WHEN Cl.Days = 'Tuesday' THEN 2
        WHEN Cl.Days = 'Wednesday' THEN 3
        WHEN Cl.Days = 'Thursday' THEN 4
        WHEN Cl.Days = 'Friday' THEN 5
        WHEN Cl.Days = 'Saturday' THEN 6
        WHEN Cl.Days = 'Sunday' THEN 7
        ELSE 8  -- In case there are any unexpected values in `Days`
    END;





