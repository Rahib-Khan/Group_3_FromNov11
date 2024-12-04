-- ==========================================================================================================================================================
-- Author:		<Rahib>
-- Create date: <12/4/2024>
-- Description: Proposition #3 Required - 
-- How may classes that are being taught that semester grouped by course and aggregate the total enrollment, total class limit and the percentage of enrollment.
-- =============================================================================================================================================================

SELECT CourseCode,
    count(a.CourseId) AS ClassCountinCourse,
    sum(Enrollment) AS TotalEnrollment,
    sum(Limit) AS TotalLimit,
    (sum(Enrollment) * 100/ sum(Limit)) AS EnrollPercent
FROM Course.CoursesCLassMode a
    JOIN Course.Class b ON a.ClassID = b.Classid
    JOIN Course.Course c ON a.CourseId = c.Courseid
GROUP BY a.CourseId,CourseCode
HAVING sum(Limit) <> 0
ORDER BY CourseCode
