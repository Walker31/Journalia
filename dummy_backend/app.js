// server.js

const express = require('express');
const http = require('http');
const bodyParser = require('body-parser');
const cors = require('cors');
const Sequelize = require('sequelize');
const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(bodyParser.json());

// PostgreSQL database configuration
const sequelize = new Sequelize('Journalia', 'postgres', 'walker', {
  host: 'localhost',
  dialect: 'postgres', // Set dialect to 'postgres' for PostgreSQL
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});

// Define Sequelize models
const User = sequelize.define('user', {
  userName: Sequelize.STRING,
  // Add other fields as needed
});

const Article = sequelize.define('article', {
  title: Sequelize.STRING,
  content: Sequelize.TEXT,
  // Add other fields as needed
});

const Comment = sequelize.define('comment', {
  content: Sequelize.TEXT,
  // Add other fields as needed
});

const Vote = sequelize.define('vote', {
  voteType: Sequelize.INTEGER, // Assuming 0 for downvote, 1 for upvote
  // Add other fields as needed
});

// Define associations (if any)
Article.hasMany(Comment);
Article.hasMany(Vote);

// Sync Sequelize models and start server
sequelize.sync({ force: false }).then(() => {
  console.log('Database & tables created!');

  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
});

// Routes

// Route to fetch articles by topic ID
app.get('/articles', async (req, res) => {
  const { topic_id } = req.query;

  try {
    const articles = await Article.findAll({
      where: { topic_id: topic_id },
      include: [
        { model: Comment },
        { model: Vote }
      ]
    });
    res.json(articles);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to fetch votes by article ID
app.get('/votes', async (req, res) => {
  const { article_id } = req.query;

  try {
    const votes = await Vote.findAll({
      where: { article_id: article_id }
    });
    res.json(votes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to fetch comments by article ID
app.get('/comments', async (req, res) => {
  const { article_id } = req.query;

  try {
    const comments = await Comment.findAll({
      where: { article_id: article_id }
    });
    res.json(comments);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to fetch author name by user ID
app.get('/users', async (req, res) => {
  const { user_id } = req.query;

  try {
    const user = await User.findByPk(user_id);
    if (user) {
      res.json(user);
    } else {
      res.status(404).json({ message: 'User not found' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
