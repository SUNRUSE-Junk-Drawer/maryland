days = require "./days"
module.exports = (gameObject, now) -> gameObject.time.weekDaysOrder[(days gameObject, now) % gameObject.time.weekDaysOrder.length]
