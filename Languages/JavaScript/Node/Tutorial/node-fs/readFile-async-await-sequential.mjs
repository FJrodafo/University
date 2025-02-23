import { readFile } from 'node:fs/promises'

console.log('\nReading the first file...')
const file1 = await readFile('./file1.txt', 'utf-8')
console.log('\nFirst file: {\n' + file1, '\n}')

console.log('\nDoing things while reading the file...')

console.log('\nReading the second file...')
const file2 = await readFile('./file2.txt', 'utf-8')
console.log('\nSecond file: {\n' + file2, '\n}')
