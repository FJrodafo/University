const path = require('node:path')

// Shows the bar separation according to your operating system
// --> unix /
// --> windows \
console.log(path.sep)

// Join rutes according to your operating system
const filePath = path.join('content', 'subfolder', 'test.txt')
console.log(filePath)

// Filename
const filename1 = path.basename('/tmp/secret-files/password.txt')
console.log(filename1)

// Filename without extension
const filename2 = path.basename('/tmp/secret-files/password.txt', '.txt')
console.log(filename2)

// Extension
const extension = path.extname('my.hd.image.jpg')
console.log(extension)
