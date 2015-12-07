uuid = require "node-uuid"
module.exports = -> uuid.unparse uuid.v4()
