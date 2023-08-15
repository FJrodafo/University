/*
const http = require('http');
const colors = require('colors');

const serverHandler = function (req, res) {
    res.writeHead(200, { 'Content-type': 'text/html' });
    res.write('<h1>Hello, World!</h1>');
    res.end();
}

const server = http.createServer(serverHandler);

server.listen(3000, function () {
    console.log('Server on port 3000'.green);
});
*/

const express = require('express');
const colors = require('colors');

const server = express();

server.get('/', (req, res) => {
    res.send('<h1>Hello, World! Using express framework!</h1>');
    res.end();
})

server.listen(3000, () => {
    console.log('Server on port 3000'.red);
});
