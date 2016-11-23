const express = require('express')
const bluebird = require('bluebird')
const app = bluebird.promisifyAll(express())
const secret = require('./secret.js')
const auth = require('./auth.js')
const db = require('./db.js')

app.get('/token', (req, res) => {

  const token = req.query.access_token

  const sendToken = (user) =>
    res.send(JSON.stringify({
      token: auth.getToken(user.dataValues.id),
      expiration_time: 3600,
      user_id: user.dataValues.id
    }))

  auth.authenticateUser(token)
    .then(({email, name, id}) =>
      db.findUser(id)
        .then(user => sendToken(user))
        .catch((err) => {
          return db.registerUser(id, email, name)
            .then(user => sendToken(user))
            .catch(err => console.error(err))
          }))
    .catch((err) => res.status(403).send(`{"error": "${err}"`))
})

const startListening = (port) => app.listenAsync(3000)

module.exports = {
  startListening
}
