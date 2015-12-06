sink = require "./sink"
module.exports = (message) -> handler "error", message for handler in sink
