const http = require('node:http')
const { findAvailablePort } = require('./free-port.cjs')

const desiredPort = process.env.PORT ?? 3000

const server = http.createServer((req, res) => {
    console.log('Request received!')
    res.end('Hello, World!')
})

findAvailablePort(desiredPort).then(port => {
    server.listen(port, () => {
        console.log(`Server listening on port http://localhost:${port}`)
    })
})