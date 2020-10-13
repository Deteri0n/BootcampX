SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, (completed_at - started_at) AS duration
FROM assistance_requests
INNER JOIN assignments ON assignments.id = assignment_id
INNER JOIN students ON students.id = student_id
INNER JOIN teachers ON teachers.id = teacher_id
ORDER BY duration ASC;