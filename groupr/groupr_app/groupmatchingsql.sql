/*When the Student STARTS a group
Select info for students whose known Skills match the current User's (Student) desired Skills*/

SELECT *
FROM Student, SkillsKnown
WHERE SkillsKnown.skillName = (
    SELECT SkillsDesired.skillName
    FROM SkillsDesired, Student
    WHERE Student.netId = <the current user's netId>;);

/*When the Student SEARCHES for OPEN GROUPS*/
