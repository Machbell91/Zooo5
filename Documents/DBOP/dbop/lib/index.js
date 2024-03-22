const http = require('http');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const url = require('url');
const querystring = require('querystring');

// Create a MySQL connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'my_user',
  password: 'my_password',
  database: 'my_database'
});

// Create an HTTP server
const server = http.createServer((req, res) => {
  // Parse the request URL and query string
  const parsedUrl = url.parse(req.url);
  const query = querystring.parse(parsedUrl.query);

  // Handle the /api/register endpoint
  if (parsedUrl.pathname === '/api/register') {
    if (req.method === 'POST') {
      let body = '';
      req.on('data', chunk => {
        body += chunk.toString();
      });
      req.on('end', async () => {
        // Parse the request body
        const jsonBody = JSON.parse(body);
        const email = jsonBody.email;
        const password = jsonBody.password;

        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Insert the user data into the database
        pool.query('INSERT INTO users (email, password) VALUES (?, ?)', [email, hashedPassword], (error, results) => {
          if (error) {
            // If there was an error, send a 500 Internal Server Error response
            res.writeHead(500, { 'Content-Type': 'application/json' });
            res.end(JSON.stringify({ error: 'Error registering user' }));
          } else {
            // If the user was registered successfully, send a 201 Created response
            res.writeHead(201, { 'Content-Type': 'application/json' });
            res.end(JSON.stringify({ message: 'User registered successfully' }));
          }
        });
      });
    } else {
      // If the request method is not POST, send a 405 Method Not Allowed response
      res.writeHead(405, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ error: 'Method not allowed' }));
    }
  } else {
    // If the request URL is not /api/register, send a 404 Not Found response
    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'Not found' }));
  }
});

// Start the server
server.listen(3000, () => {
  console.log('Server listening on port 3000');
});
