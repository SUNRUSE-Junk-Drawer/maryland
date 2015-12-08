describe "years", ->
	years = require "./years"
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
					months:
						"e5aab108-4cf0-46d2-9b20-385c3fe64165":
							days: 31
						"b75dc30d-c6b6-465e-b1f4-a3b40c3e5359":
							days: 28
						"6612e205-215d-4536-a6c4-bfb66b782dcf":
							days: 31
						"52fa7592-a5ec-4857-8f67-d7bfe1b7ef7a":
							days: 30
						"1a44abbe-2371-4536-b504-4a93cb16807b":
							days: 31
						"118cf644-a6e3-4440-9bdf-2c5e0a1f8730":
							days: 30
						"8ac60089-f51b-4ef9-a335-602e53bda42f":
							days: 31
						"5cfaddf8-b23a-4445-ba67-7d2e47139494":
							days: 30
						"e1202900-1d89-4646-8af9-07944aa236f8":
							days: 31
						"45343f85-5b99-47ad-9b9d-74ff54fb52cc":
							days: 31
						"8590f8e2-f9ab-4ff1-943c-102f608257e2":
							days: 30
						"08bcace4-9430-4b1b-b2e1-4d148479e725":
							days: 31
					monthsOrder: [
						"e5aab108-4cf0-46d2-9b20-385c3fe64165"
						"b75dc30d-c6b6-465e-b1f4-a3b40c3e5359"
						"6612e205-215d-4536-a6c4-bfb66b782dcf"
						"52fa7592-a5ec-4857-8f67-d7bfe1b7ef7a"
						"45343f85-5b99-47ad-9b9d-74ff54fb52cc"
						"8590f8e2-f9ab-4ff1-943c-102f608257e2"
						"08bcace4-9430-4b1b-b2e1-4d148479e725"
						"1a44abbe-2371-4536-b504-4a93cb16807b"
						"118cf644-a6e3-4440-9bdf-2c5e0a1f8730"
						"8ac60089-f51b-4ef9-a335-602e53bda42f"
						"5cfaddf8-b23a-4445-ba67-7d2e47139494"
						"e1202900-1d89-4646-8af9-07944aa236f8"
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
				months:
					"8590f8e2-f9ab-4ff1-943c-102f608257e2":
						days: 30
					"08bcace4-9430-4b1b-b2e1-4d148479e725":
						days: 31
					"1a44abbe-2371-4536-b504-4a93cb16807b":
						days: 31
					"118cf644-a6e3-4440-9bdf-2c5e0a1f8730":
						days: 30
					"8ac60089-f51b-4ef9-a335-602e53bda42f":
						days: 31
					"5cfaddf8-b23a-4445-ba67-7d2e47139494":
						days: 30
					"e1202900-1d89-4646-8af9-07944aa236f8":
						days: 31
					"e5aab108-4cf0-46d2-9b20-385c3fe64165":
						days: 31
					"b75dc30d-c6b6-465e-b1f4-a3b40c3e5359":
						days: 28
					"6612e205-215d-4536-a6c4-bfb66b782dcf":
						days: 31
					"52fa7592-a5ec-4857-8f67-d7bfe1b7ef7a":
						days: 30
					"45343f85-5b99-47ad-9b9d-74ff54fb52cc":
						days: 31
				monthsOrder: [
					"e5aab108-4cf0-46d2-9b20-385c3fe64165"
					"b75dc30d-c6b6-465e-b1f4-a3b40c3e5359"
					"6612e205-215d-4536-a6c4-bfb66b782dcf"
					"52fa7592-a5ec-4857-8f67-d7bfe1b7ef7a"
					"45343f85-5b99-47ad-9b9d-74ff54fb52cc"
					"8590f8e2-f9ab-4ff1-943c-102f608257e2"
					"08bcace4-9430-4b1b-b2e1-4d148479e725"
					"1a44abbe-2371-4536-b504-4a93cb16807b"
					"118cf644-a6e3-4440-9bdf-2c5e0a1f8730"
					"8ac60089-f51b-4ef9-a335-602e53bda42f"
					"5cfaddf8-b23a-4445-ba67-7d2e47139494"
					"e1202900-1d89-4646-8af9-07944aa236f8"
				]
	describe "on calling with zero", ->
		beforeEach -> result = years gameObject, 0
		it "returns the number of years passed", -> expect(result).toEqual 0
		check()
	describe "on calling between integers", ->
		beforeEach -> result = years gameObject, 1314000
		it "returns the number of years passed", -> expect(result).toEqual 2
		check()
	describe "on calling close to a lower bound", ->
		beforeEach -> result = years gameObject, 1103760
		it "returns the number of years passed", -> expect(result).toEqual 2
		check()
	describe "on calling close to an upper bound", ->
		beforeEach -> result = years gameObject, 1524240
		it "returns the number of years passed", -> expect(result).toEqual 2
		check()
