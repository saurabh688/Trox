require('dotenv').config();
module.exports = {
    PORT: process.env.PORT || 8080,
    API_VERSION: "/api/v1",
    SALT: ""
}