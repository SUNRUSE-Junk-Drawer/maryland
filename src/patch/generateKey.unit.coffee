describe "generateKey", ->
	generateKey = require "./generateKey"
	it "returns a string", -> expect(generateKey()).toEqual jasmine.any String
	it "returns a different string each call", -> expect(generateKey()).not.toEqual generateKey()
