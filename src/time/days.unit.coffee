describe "days", ->
	days = require "./days"
	result = gameObject = undefined
	check = ->
		it "does not modify the game database object", ->
			expect(gameObject).toEqual 
				time:
					minutesPerHour: 60
					hoursPerDay: 24
	beforeEach ->
		gameObject = 
			time:
				minutesPerHour: 60
				hoursPerDay: 24
	describe "on calling with zero", ->
		beforeEach -> result = days gameObject, 0
		it "returns the number of passed days", -> expect(result).toEqual 0
		check()
	describe "on calling between integers", ->
		beforeEach -> result = days gameObject, 3600
		it "returns the number of passed days", -> expect(result).toEqual 2
		check()
	describe "on calling close to a lower bound", ->
		beforeEach -> result = days gameObject, 2890
		it "returns the number of passed days", -> expect(result).toEqual 2
		check()
	describe "on calling close to an upper bound", ->
		beforeEach -> result = days gameObject, 4310
		it "returns the number of passed days", -> expect(result).toEqual 2
		check()
