-- ==============================================================================
-- Author:       Almas Haque
-- Create date:  12/5/2024
-- Description:  Retrieve and display the number of instructors in each department to help assess the distribution of academic staff across departments.
-- ==============================================================================

SELECT d.DepartmentName, COUNT(i.InstructorID) AS NumberOfInstructors
FROM Department.Departments AS d
JOIN Department.InstructorDepartment AS id ON d.DepartmentID = id.DepartmentID
JOIN Department.Instructor AS i ON id.InstructorID = i.InstructorID
GROUP BY d.DepartmentName;