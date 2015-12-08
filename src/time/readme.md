The "time" property in the root of the game object is an object containing:

- now
	An integer specifying the number of game minutes passed.
	Initially zero.
	One game minute passes every second.
- minutesPerHour
	An integer specifying how many minutes are in an hour.
- hoursPerDay
	An integer specifying how many hours are in a day.
- weekDays
	A hash map to objects specifying the days in a week.
	Each contains:
		* name
			A localization key-string map for full names, i.e Monday.
		* abbreviation
			A localization key-string map for shortened names, i.e. Mon.
		* isWorkingDay
			When truthy, the day is considered a working day, i.e. not the weekend.
- weekDaysOrder
	An array of strings specifying the order of the keys in weekDays.
- months
	A hash map to objects specifying the months in a year.
	Each contains:
		* name
			A localization key-string map for full names, i.e Monday.
		* abbreviation
			A localization key-string map for shortened names, i.e. Mon.
		* days
			The number of days in the month, as an integer.
- monthsOrder
	An array of strings specifying the order of the keys in months.

# Modules

## hours

Given the game database object and a number of minutes, returns how many hours it represents.
Rounds down.

## days

Given the game database object and a number of minutes, returns how many days it represents.
Rounds down.

## weeks

Given the game database object and a number of minutes, returns how many weeks it represents.
Rounds down.

## months

Given the game database object and a number of minutes since the beginning of the year zero, returns the number of months which have passed.
Rounds down.

## years

Given the game database object and a number of minutes, returns how many years it represents.
Rounds down.

## weekDay

Given the game database object and a number of minutes since the beginning of the year zero, returns the key of the day of the week.

## month

Given the game database object and a number of minutes since the beginning of the year zero, returns the key of the month of the year.
