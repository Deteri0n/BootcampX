SELECT cohorts.name AS cohort, COUNT(assignment_submissions.id) AS total_submissions
FROM cohorts
INNER JOIN students ON cohorts.id = cohort_id
INNER JOIN assignment_submissions ON students.id = student_id
GROUP BY cohort
ORDER BY total_submissions DESC;