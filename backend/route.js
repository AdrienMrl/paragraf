const express = require('express')
const bluebird = require('bluebird')
const app = bluebird.promisifyAll(express())

app.get('/stories/feed', (req, res) => {
  console.log(req.query)
  res.send('{"Hello": "World"}')
})

const startListening = (port) => app.listenAsync(3000)

module.exports = {
  startListening
}
