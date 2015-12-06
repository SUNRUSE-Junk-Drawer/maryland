sink = require "./sink"
module.exports = (message) -> handler "warning", message for handler in sink
