module.exports = (gameObject, now) -> Math.floor (now / gameObject.time.minutesPerHour / gameObject.time.hoursPerDay)
