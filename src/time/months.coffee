module.exports = (gameObject, now) -> 
	months = -1
	month = 0
	while now >= 0
		months++
		now -= gameObject.time.months[gameObject.time.monthsOrder[month]].days * gameObject.time.hoursPerDay * gameObject.time.minutesPerHour
		month++
		if month is gameObject.time.monthsOrder.length then month = 0
	months
