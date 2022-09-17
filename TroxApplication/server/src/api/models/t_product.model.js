const { UUID, UUIDV4, STRING, BOOLEAN } = require('sequelize');

const sequelize = require('../db/db');

const Product = sequelize.define('Product', {
    id: {
        type: UUID,
        defaultValue: UUIDV4,
        primaryKey: true,
        allowNull: false
    },
    productName: {
        type: STRING,
        allowNull: false
    },
    productCategory: {
        type: STRING,
        allowNull: false
    },
    productSubCategory: {
        type: STRING
    },
    price: {
        type: STRING,
        allowNull: false
    },
    availableStock: {
        type: STRING
    },
    brand: {
        type: STRING
    },
    ageGroup: {
        type: STRING
    },
    description: {
        type: STRING,
        allowNull: false
    },
    batchNumber: {
        type: STRING,
        allowNull: false
    },
    productStat: {
        type: STRING
    },
    productLevel: {
        type: STRING
    },
    skuID: {
        type: STRING,
        allowNull: false
    },
    GTIN: {
        type: STRING
    },
    MPN: {
        type: STRING
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

module.exports = Product;