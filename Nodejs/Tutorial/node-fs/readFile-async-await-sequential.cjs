const fs = require('node:fs/promises')

    // IIFE - Immediately Invoked Function Expression
    ; (
        async () => {
            console.log('\nReading the first file...')
            const file1 = await fs.readFile('./file1.txt', 'utf-8')
            console.log('\nFirst file: {\n' + file1, '\n}')

            console.log('\nDoing things while reading the file...')

            console.log('\nReading the second file...')
            const file2 = await fs.readFile('./file2.txt', 'utf-8')
            console.log('\nSecond file: {\n' + file2, '\n}')
        }
    )()

// Both codes are equal:

/*
async function init() {
    console.log('\nReading the first file...')
    const file1 = await fs.readFile('./file1.txt', 'utf-8')
    console.log('\nFirst file: {\n' + file1, '\n}')

    console.log('\nDoing things while reading the file...')

    console.log('\nReading the second file...')
    const file2 = await fs.readFile('./file2.txt', 'utf-8')
    console.log('\nSecond file: {\n' + file2, '\n}')
}

init()
*/
