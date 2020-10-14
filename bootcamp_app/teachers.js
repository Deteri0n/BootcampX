const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
// Store all potentially malicious values in an array. 
const values = [`%${cohortName}%`];
const text = `
SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
INNER JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;`;

pool.query(text, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));