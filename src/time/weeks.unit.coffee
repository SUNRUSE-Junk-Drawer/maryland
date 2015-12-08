describe "weeks", ->
	weeks = require "./weeks"
	result = gameObject = undefined
	check = ->
		it "does not modify the game database object", ->
			expect(gameObject).toEqual 
				time:
					minutesPerHour: 60
					hoursPerDay: 24
					weekDaysOrder: [
						"57d37aa8-7dd2-461b-a4ea-2943ad0abb84"
						"c9c1cce6-180d-414e-9b1c-3709a13092ee"
						"66db47bd-056b-409c-a30d-5f198b91a74a"
						"dae6dc2c-2c9e-4332-9a7e-78ff3d86032d"
						"99294e57-7c1e-4a90-89c2-bcf1abe12bd1"
						"d85654f5-7bee-4c40-b603-dc91b192866b"
						"0b6bed97-db31-4c18-9aae-5d6d4e21806c"
					]
	beforeEach ->
		gameObject = 
			time:
				minutesPerHour: 60
				hoursPerDay: 24
				weekDaysOrder: [
					"57d37aa8-7dd2-461b-a4ea-2943ad0abb84"
					"c9c1cce6-180d-414e-9b1c-3709a13092ee"
					"66db47bd-056b-409c-a30d-5f198b91a74a"
					"dae6dc2c-2c9e-4332-9a7e-78ff3d86032d"
					"99294e57-7c1e-4a90-89c2-bcf1abe12bd1"
					"d85654f5-7bee-4c40-b603-dc91b192866b"
					"0b6bed97-db31-4c18-9aae-5d6d4e21806c"
				]
	describe "on calling with zero", ->
		beforeEach -> result = weeks gameObject, 0
		it "returns the number of passed weeks", -> expect(result).toEqual 0
		check()
	describe "on calling between integers", ->
		beforeEach -> result = weeks gameObject, 25200
		it "returns the number of passed weeks", -> expect(result).toEqual 2
		check()
	describe "on calling close to a lower bound", ->
		beforeEach -> result = weeks gameObject, 21168
		it "returns the number of passed weeks", -> expect(result).toEqual 2
		check()
	describe "on calling close to an upper bound", ->
		beforeEach -> result = weeks gameObject, 29232
		it "returns the number of passed weeks", -> expect(result).toEqual 2
		check()
