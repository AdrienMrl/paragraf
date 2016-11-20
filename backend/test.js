const bluebird = require('bluebird')
const assert = require('assert')
const request = bluebird.promisify(require('request'), {multiArgs: true})
const route = require('./route.js')
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

describe('API', () => {
  describe('server', () =>
    it('should HTTP listen', () => route.startListening(3000)))
  describe('GET', () => {
    it('should return a stories feed', () =>
      call('/stories/feed?limit=10')
        .spread((response, body) => assert(objectIsOfSameType(JSON.parse(body), basicStory))))
  })
})
