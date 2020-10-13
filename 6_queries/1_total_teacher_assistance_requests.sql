SELECT COUNT(assistance_requests.id) AS total_assistances, teachers.name AS name
FROM assistance_requests
INNER JOIN teachers ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY name;