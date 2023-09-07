const fs = require('node:fs')

const stats = fs.statSync('./file1.txt')

console.log(
    '\nIs it a directory?', stats.isDirectory(),
    '\nIs it a file?:', stats.isFile(),
    '\nIs it a symbolic link?', stats.isSymbolicLink(),
    '\nSize in bytes:', stats.size
)
