const fs = require('node:fs')

console.log('\nReading the first file...')
fs.readFile('./file1.txt', 'utf-8', (err, data) => {
    if (err) throw err
    console.log('\nFirst file: {\n' + data, '\n}')
})

console.log('\nDoing things while reading the file...')

console.log('\nReading the second file...')
fs.readFile('./file2.txt', 'utf-8', (err, data) => {
    if (err) throw err
    console.log('\nSecond file: {\n' + data, '\n}')
})
