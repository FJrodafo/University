const fs = require('node:fs')
const { promisify } = require('node:util')
// Only in native modules that do not have native promises
const readFilePromise = promisify(fs.readFile)

console.log('\nReading the first file...')
readFilePromise('./file1.txt', 'utf-8').then(file => {
    console.log('\nFirst file: {\n' + file, '\n}')
})

console.log('\nDoing things while reading the file...')

console.log('\nReading the second file...')
readFilePromise('./file2.txt', 'utf-8').then(file => {
    console.log('\nSecond file: {\n' + file, '\n}')
})
