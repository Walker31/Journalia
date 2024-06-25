const { Sequelize } = require('sequelize');
const config = require('./config').db;

const sequelize = new Sequelize(config.database, config.username, config.password, {
  host: config.host,
  port: config.port,
  dialect: 'postgres',
});

module.exports = sequelize;
