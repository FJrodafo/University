const fs = require('node:fs/promises')
const path = require('node:path')
const cf = require('@fjrodafo/colors')

const folder = process.argv[2] ?? '.'

async function ls(folder) {
    let files

    try {
        files = await fs.readdir(folder)
    } catch {
        console.error(cf.red(`Could not read directory ${folder}`))
        process.exit(1)
    }

    const filesPromises = files.map(async file => {
        const filePath = path.join(folder, file)
        let stats

        try {
            stats = await fs.stat(filePath)
        } catch {
            console.error(cf.red(`Could not read directory ${folder}`))
            process.exit(1)
        }

        const isDirectory = stats.isDirectory()
        const fileType = isDirectory ? 'd' : 'f'
        const fileSize = stats.size.toString()
        const fileModified = stats.mtime.toLocaleString()

        return `${cf.bgMagenta(fileType)} ${cf.blue(file.padEnd(20))} ${cf.green(fileSize.padStart(18))} ${cf.yellow(fileModified)}`
    })

    const filesInfo = await Promise.all(filesPromises)

    filesInfo.forEach(fileInfo => console.log(fileInfo))
}

ls(folder)
