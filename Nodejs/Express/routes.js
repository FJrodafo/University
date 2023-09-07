const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
    // res.end('Hello, World!')
    res.render('index.ejs')
})

router.get('/login', (req, res) => {
    // res.end('Login here!')
    res.render('login.ejs')
})

module.exports = router
