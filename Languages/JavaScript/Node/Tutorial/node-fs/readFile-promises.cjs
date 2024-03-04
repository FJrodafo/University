const fs = require('node:fs/promises')

console.log('\nReading the first file...')
fs.readFile('./file1.txt', 'utf-8').then(file => {
    console.log('\nFirst file: {\n' + file, '\n}')
})

console.log('\nDoing things while reading the file...')

console.log('\nReading the second file...')
fs.readFile('./file2.txt', 'utf-8').then(file => {
    console.log('\nSecond file: {\n' + file, '\n}')
})
