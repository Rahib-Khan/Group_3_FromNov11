-- ==========================================================================================
-- Author:		<Rahib>
-- Create date: <12/4/2024>
-- Description:	Proposition #2 Required - How many instructors are in each department?
-- ==========================================================================================

SELECT DepartmentName, count(b.InstructorId) as InstructorCount
FROM Department.Departments a
    JOIN Department.InstructorDepartment b ON a.DepartmentID = b.DepartmentID
    JOIN Department.Instructor c ON c.InstructorID = b.InstructorId
WHERE b.InstructorID <> 676 -- The ID Number for John Smith AKA the Anaomly Instructor 
GROUP BY DepartmentName
