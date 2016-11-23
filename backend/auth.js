const secret = require('./secret.js')
const bluebird = require('bluebird')
const request = bluebird.promisify(require('request'), {multiArgs: true})

const tokens = {}

const genRandomNumber = () => Math.random().toString(36).substr(2) // remove `0.`
const genBigRandomNumber = () => genRandomNumber() + genRandomNumber() + genRandomNumber()
const genRandomUniqueNumber = genBigRandomNumber

const genToken = userKey => tokens[userKey] = genRandomUniqueNumber()
const getToken = userKey => tokens[userKey] ? tokens[userKey] : genToken(userKey)

const authenticateUser = (token) =>
  request(`https://graph.facebook.com/me?access_token=${token}&fields=email,name`)
    .spread((response, body) => {
      if (response.statusCode === 200) {
        return Promise.resolve(JSON.parse(body))
      }
      return Promise.reject(new Error(JSON.stringify(response)))
    })

module.exports = {
  authenticateUser,
  getToken
}
