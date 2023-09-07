const fs = require('node:fs')

console.log('\nReading the first file...')
const file1 = fs.readFileSync('./file1.txt', 'utf-8')
console.log('\nFirst file: {\n' + file1, '\n}')

console.log('\nDoing things while reading the file...')

console.log('\nReading the second file...')
const file2 = fs.readFileSync('./file2.txt', 'utf-8')
console.log('\nSecond file: {\n' + file2, '\n}')
