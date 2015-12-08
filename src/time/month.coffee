module.exports = (gameObject, now) -> 
	month = 0
	loop
		monthObj = gameObject.time.months[gameObject.time.monthsOrder[month]]
		now -= monthObj.days * gameObject.time.hoursPerDay * gameObject.time.minutesPerHour
		if now < 0 then return gameObject.time.monthsOrder[month]
		month++
		if month is gameObject.time.monthsOrder.length then month = 0
