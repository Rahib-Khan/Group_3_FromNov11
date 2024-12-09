-- ==============================================================================
-- Author:       Almas Haque
-- Create date:  12/5/2024
-- Description:  Identify instructors who teach multiple classes across different departments to highlight their roles and understand workload distribution.
-- ==============================================================================

SELECT i.FullName, COUNT(cl.ClassID) AS NumberOfClasses, d.DepartmentName
FROM Department.Instructor AS i
JOIN Department.InstructorDepartment AS id ON i.InstructorID = id.InstructorID
JOIN Department.Departments AS d ON id.DepartmentID = d.DepartmentID
JOIN Course.Class AS cl ON i.InstructorID = cl.InstructorID
GROUP BY i.FullName, d.DepartmentName
HAVING COUNT(cl.ClassID) > 1;