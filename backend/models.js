const Sequelize = require('sequelize')
const sequelize = new Sequelize('mysql://paragraf:motdepasse@localhost:3306/paragraf')

const User = sequelize.define('user', {
  email: {
    type: Sequelize.STRING,
  },
  fullName: {
    type: Sequelize.STRING
  }
})

const Story = sequelize.define('story', {
  title: {
    type: Sequelize.STRING,
  },
  upvotes: {
    type: Sequelize.INTEGER,
  }
})

const Paragraph = sequelize.define('paragraph', {
  content: {
    type: Sequelize.STRING
  }
})

Story.hasMany(Paragraph)
Paragraph.belongsTo(User, {as: 'author'})

User.sync()
  .then(() => Story.sync())
  .then(() => Paragraph.sync())
  .catch((err) => console.log(err))

module.exports = {
  User,
  Story,
  Paragraph
}
