SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
INNER JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
