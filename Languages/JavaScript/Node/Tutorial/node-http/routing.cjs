const http = require('node:http') // HTTP - Hypertext Transfer Protocol
const dittoJSON = require('./pokemon/ditto.json')
const { findAvailablePort } = require('@fjrodafo/port-finder')

const desiredPort = process.env.PORT ?? 3000

const processRequest = (req, res) => {
    const { method, url } = req
    switch (method) {
        case 'GET':
            switch (url) {
                case '/pokemon/ditto':
                    res.statusCode = 200 // OK
                    res.setHeader('Content-Type', 'application/json; charset=utf-8')
                    return res.end(JSON.stringify(dittoJSON))
                default:
                    res.statusCode = 404 // Not Found
                    res.setHeader('Content-Type', 'text/plain; charset=utf-8')
                    res.end('Not Found')
            }
        case 'POST':
            switch (url) {
                case '/pokemon': {
                    let body = ''
                    req.on('data', chunk => {
                        body += chunk.toString()
                    })

                    req.on('end', () => {
                        const data = JSON.parse(body)
                        res.writeHead(201, { 'Content-Type': 'text/plain; charset=utf-8' })
                        data.timestamp = Date.now()
                        res.end(JSON.stringify(data))
                    })
                    break
                }
                default:
                    res.statusCode = 404 // Not Found
                    res.setHeader('Content-Type', 'text/plain; charset=utf-8')
                    res.end('Not Found')
            }
    }
}

const server = http.createServer(processRequest)

findAvailablePort(desiredPort).then(port => {
    server.listen(port, () => {
        console.log(`Server listening on port http://localhost:${port}`)
    })
})
