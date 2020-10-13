SELECT COUNT(assistance_requests.id) AS total_assistances, students.name AS name
FROM assistance_requests
INNER JOIN students ON students.id = student_id
WHERE name = 'Elliot Dickinson'
GROUP BY name;