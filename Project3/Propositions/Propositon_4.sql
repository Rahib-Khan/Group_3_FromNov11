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

