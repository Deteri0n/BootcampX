SELECT cohorts.name AS cohort_name, COUNT(students.id) AS nb_students
FROM cohorts
INNER JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
-- Makes more sens to GROUP BY cohort_name which is part of the students table
HAVING COUNT(students.id) >= 18
ORDER BY COUNT(students.id) ASC;
-- Can use ORDER BY nb_student;