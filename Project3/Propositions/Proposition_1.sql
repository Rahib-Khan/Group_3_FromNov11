-- =================================================================================================================
-- Author:		<Rahib>
-- Create date: <12/4/2024>
-- Description: Proposition #1 Required - Show all instructors who are teaching in classes in multiple departments
-- =================================================================================================================      
SELECT
    i.FirstName,
    i.LastName,
    COUNT(DISTINCT d.Departmentid) AS NumberOfDepartments
FROM
    Department.Instructor i
    JOIN Department.InstructorDepartment id ON i.InstructorID = id.InstructorID
    JOIN Department.Departments d ON id.DepartmentID = d.DepartmentID
GROUP BY
    i.FirstName, i.LastName
HAVING
    COUNT(DISTINCT d.DepartmentID) > 1;