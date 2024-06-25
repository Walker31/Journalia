const { DataTypes } = require('sequelize');
const sequelize = require('../sequelize');

const Vote = sequelize.define('Vote', {
  voteId: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  articleId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  voteType: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});

module.exports = Vote;
