// Modules
const express = require('express')
const { findAvailablePort } = require('@fjrodafo/port-finder')
const routes = require('./routes')
const routesApi = require('./routes-api')

// Create server
const app = express()

// Settings
app.set('appName', 'Express server')

app.set('views', __dirname + '/views')

app.set('view engine', 'ejs')

// middlewares
app.use((req, res, next) => {
    console.log(req.method, req.url, req.params.id, Date.now())
    next()
})

// Routes
app.use(routes)
app.use('/api', routesApi)

app.get('*', (req, res) => {
    res.end('Not found')
})

// Listening port
findAvailablePort(3000).then(port => {
    app.listen(port, () => {
        console.log('App name:', app.get('appName'))
        console.log(`Server listening on port http://localhost:${port}`)
    })
})
