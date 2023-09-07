import { readFile } from 'node:fs/promises'

Promise.all([
    readFile('./file1.txt', 'utf-8'),
    readFile('./file2.txt', 'utf-8')
]).then(([file1, file2]) => {
    console.log('\nFirst file: {\n' + file1, '\n}')
    console.log('\nSecond file: {\n' + file2, '\n}')
})
