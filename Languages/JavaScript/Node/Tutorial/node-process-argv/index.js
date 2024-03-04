// Input arguments
console.log(process.argv)

// Current Working Directory
console.log(process.cwd())

// Platform
console.log(process.platform)

// Environment variables
// --> NODE_ENV=hello node index.js
console.log(process.env.NODE_ENV)

// Control process events
process.on('exit', () => {
    // Clean up resources
})

// Control the process and its output
process.exit(1)
