const db = require('./models')

const registerUser = (facebookId, email, name) =>
  db.User.create({
    email,
    fullName: name,
    reputation: 1,
    facebookId
  })

const findUser = (facebookId) => db.User.findOne({
  where: {facebookId}
})

module.exports = {
  registerUser,
  findUser
}
