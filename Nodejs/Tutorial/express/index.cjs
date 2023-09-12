const express = require('express')
const ditto = require('./pokemon/ditto.json')

const PORT = process.env.PORT ?? 3000

const app = express()

app.disable('x-powered-by')

app.use(express.json())
/*
app.use((req, _res, next) => {
    if (req.method !== 'POST') return next()

    if (req.headers['content-type'] !== 'application/json') return next()

    let body = ''

    req.on('data', chunk => {
        body += chunk.toString()
    })

    req.on('end', () => {
        const data = JSON.parse(body)
        data.timestamp = Date.now()
        req.body = data
        next()
    })
})
*/

app.get('/', (_req, res) => {
    res.status(200).send('<h2>Hello, World!</h2>')
    // res.status(200).json({ message: 'Hello, World!' })
})

app.get('/pokemon/ditto', (_req, res) => {
    res.status(200).json(ditto)
})

app.post('/pokemon', (req, res) => {
    res.status(201).json(req.body)
})

app.use((_req, res) => {
    res.status(404).send('<h2>Not Found</h2>')
})

app.listen(PORT, () => {
    console.log(`Server listening on port http://localhost:${PORT}`)
})
