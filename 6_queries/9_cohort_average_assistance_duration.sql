SELECT AVG(querie.total_duration) AS average_total_duration 
FROM (
  SELECT cohorts.name, SUM(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
  FROM assistance_requests
  INNER JOIN students ON students.id = student_id
  INNER JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
) AS querie;