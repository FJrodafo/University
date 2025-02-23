const fs = require('node:fs')

fs.readdir('.', (err, data) => {
    if (err) throw err
    data.forEach(data => {
        console.log(data)
    })
})

// Both codes are equal:

/*
const fs = require('node:fs/promises')

fs.stat('content')

fs.readdir('.')
    .then(files => {
        files.forEach(file => {
            console.log(file)
        })
    })
    .catch(err => {
        console.error('Something broke!', err)
        return;
    })
*/
