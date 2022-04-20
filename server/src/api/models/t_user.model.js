const { UUID, UUIDV4, STRING, BOOLEAN, NUMBER } = require('sequelize');

const sequelize = require('../db/db');

const User = sequelize.define("User", {
    id: {
        type: UUID,
        defaultValue: UUIDV4,
        primaryKey: true,
        allowNull: false
    },
    name: {
        type: STRING
    },
    phoneNumber: {
        type: STRING
    },
    emailID: {
        type: STRING,
        allowNull: false,
        validate: {
            isEmail: true,
        }
    },
    address: {
        type: STRING
    },
    zip: {
        type: NUMBER
    },
    isDeleted: {
        type: BOOLEAN,
        defaultValue: false
    },
    createdBy: {
        type: STRING
    },
    updatedBy: {
        type: STRING
    }
});

module.exports = User;