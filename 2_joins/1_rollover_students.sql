SELECT students.name AS student_name, students.start_date AS student_start_date, cohorts.name AS cohort_name, cohorts.start_date AS cohort_start_date
FROM students
INNER JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.start_date <> students.start_date
ORDER BY cohorts.start_date;