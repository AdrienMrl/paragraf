const bluebird = require('bluebird')
const assert = require('assert')
const request = bluebird.promisify(require('request'), {multiArgs: true})
const route = require('./route.js')
const secret = require('./secret.js')
const serv_addr = "localhost"
const serv_port = 3000

const call = (endpoint) =>
  request(`http://${serv_addr}:${serv_port}${endpoint}`)

const basicStory = {
    title: "Harry Potten",
    upvote: 32,
    contributors: [
        {
            name: "Adri",
            id: 6872364
        }
    ],
    paragraphs: [
        {
            author_name: "Adri",
            author_id: 7283746,
            parution: 78326482736,
            text: "Paragraph content"
        }
    ]
}

const objectIsOfSameType = (objA, objB) => {
  const keysA = Object.keys(objA)
  const keysB = Object.keys(objB)
  if (JSON.stringify(keysA) !== JSON.stringify(keysB)) {
    return false
  }

  let sameType = true

  keysA.forEach((key) => {
    if (!objectIsOfSameType(objA[key], objB[key]))
      sameType = false
  })
  return sameType
}

route.startListening(3000)

describe('API', () => {
  describe('GET', () => {
    it('should return a token', () =>
      call(`/token?access_token=${secret.TOKEN_TEST}`)
        .spread((response, body) => assert(typeof(JSON.parse(body).token) === 'string')))

/*
    it('should return a stories feed', () =>
        .spread((response, body) => console.log(body)))
//        .spread((response, body) => assert(objectIsOfSameType(JSON.parse(body), basicStory))))
*/
  })
})
