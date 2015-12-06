sink = require "./sink"
module.exports = (message) -> handler "information", message for handler in sink
