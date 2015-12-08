module.exports = (gameObject, now) ->
	daysInYear = 0
	(daysInYear += gameObject.time.months[month].days) for month in gameObject.time.monthsOrder
	minutesInYear = daysInYear * gameObject.time.hoursPerDay * gameObject.time.minutesPerHour
	Math.floor (now / minutesInYear)
