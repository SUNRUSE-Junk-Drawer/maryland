describe "hours", ->
	hours = require "./hours"
	result = gameObject = undefined
	check = ->
		it "does not modify the game database object", ->
			expect(gameObject).toEqual 
				time:
					minutesPerHour: 60
	beforeEach ->
		gameObject = 
			time:
				minutesPerHour: 60
	describe "on calling with zero", ->
		beforeEach -> result = hours gameObject, 0
		it "returns the number of passed hours", -> expect(result).toEqual 0
		check()
	describe "on calling between integers", ->
		beforeEach -> result = hours gameObject, 150
		it "returns the number of passed hours", -> expect(result).toEqual 2
		check()
	describe "on calling close to a lower bound", ->
		beforeEach -> result = hours gameObject, 130
		it "returns the number of passed hours", -> expect(result).toEqual 2
		check()
	describe "on calling close to an upper bound", ->
		beforeEach -> result = hours gameObject, 170
		it "returns the number of passed hours", -> expect(result).toEqual 2
		check()
