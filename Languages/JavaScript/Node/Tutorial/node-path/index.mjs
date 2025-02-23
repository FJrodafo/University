import { sep, join, basename, extname } from 'node:path'

// Shows the bar separation according to your operating system
// --> unix /
// --> windows \
console.log(sep)

// Join rutes according to your operating system
const filePath = join('content', 'subfolder', 'test.txt')
console.log(filePath)

// Filename
const filename1 = basename('/tmp/secret-files/password.txt')
console.log(filename1)

// Filename without extension
const filename2 = basename('/tmp/secret-files/password.txt', '.txt')
console.log(filename2)

// Extension
const extension = extname('my.hd.image.jpg')
console.log(extension)
