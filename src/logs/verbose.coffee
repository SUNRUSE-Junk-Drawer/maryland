sink = require "./sink"
module.exports = (message) -> handler "verbose", message for handler in sink
