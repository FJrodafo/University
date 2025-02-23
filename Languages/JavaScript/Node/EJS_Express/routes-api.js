const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
    res.json({
        myFirstApi: 'Works!'
    })
})

module.exports = router
