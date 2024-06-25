const { DataTypes } = require('sequelize');
const sequelize = require('../sequelize');

const Topic = sequelize.define('Topic', {
  topicId: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  topicName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

module.exports = Topic;
