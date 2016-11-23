const Sequelize = require('sequelize')
const sequelize = new Sequelize('mysql://paragraf:motdepasse@localhost:3306/paragraf', {logging: null})

const User = sequelize.define('user', {
  email: {
    type: Sequelize.STRING
  },
  fullName: {
    type: Sequelize.STRING
  },
  reputation: {
    type: Sequelize.INTEGER
  },
  facebookId: {
    type: Sequelize.STRING
  }
})

const Story = sequelize.define('story', {
  title: {
    type: Sequelize.STRING
  },
  upvotes: {
    type: Sequelize.INTEGER
  },
  background: {
    type: Sequelize.INTEGER
  },
  opened: {
    type: Sequelize.BOOLEAN
  }
})

const Contributor = sequelize.define('contributor')

const Paragraph = sequelize.define('paragraph', {
  content: {
    type: Sequelize.STRING
  }
})

Story.hasMany(Paragraph)
Story.hasMany(Contributor)
Contributor.belongsTo(User)
Paragraph.belongsTo(User, {as: 'author'})

/*
const force = undefined // {force: true}
Promise.all([Paragraph.sync(force), Contributor.sync(force), User.sync(force), Story.sync(force)])
  .catch((err) => console.log(err))
  */

module.exports = {
  User,
  Story,
  Paragraph
}
