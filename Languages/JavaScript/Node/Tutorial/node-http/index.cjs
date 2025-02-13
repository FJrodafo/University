const http = require('node:http') // HTTP - Hypertext Transfer Protocol
const fs = require('node:fs')
const { findAvailablePort } = require('@fjrodafo/port-finder')

// Status Code https://http.cat/

const desiredPort = process.env.PORT ?? 3000

const processRequest = (req, res) => {
    res.setHeader('Content-Type', 'text/html; charset=utf-8')

    if (req.url === '/') {
        res.statusCode = 200 // OK
        res.end('<h2>Hello, World!</h2>')
    } else if (req.url === '/image.png') {
        fs.readFile('./../../Assets/Light.png', (err, data) => {
            if (err) {
                res.statusCode = 500 // Internal Server Error
                res.end('<h2>Internal Server Error</h2>')
            } else {
                res.statusCode = 200 // OK
                res.setHeader('Content-Type', 'image/png')
                res.end(data)
            }
        })
    } else if (req.url === '/contact') {
        res.statusCode = 200 // OK
        res.end('<h2>Contact</h2>')
    } else {
        res.statusCode = 404 // Not Found
        res.setHeader('Content-Type', 'text/plain; charset=utf-8')
        res.end('Not Found')
    }
}

const server = http.createServer(processRequest)

findAvailablePort(desiredPort).then(port => {
    server.listen(port, () => {
        console.log(`Server listening on port http://localhost:${port}`)
    })
})
