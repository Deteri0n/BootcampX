const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const paramArr = process.argv.slice(2);
pool.query(`
SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
INNER JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));