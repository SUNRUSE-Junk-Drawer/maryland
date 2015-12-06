describe "sink", ->
	rewire = require "rewire"
	sink = undefined
	beforeEach ->
		sink = rewire "./sink"
	it "is an array", ->
		expect(sink).toEqual jasmine.any Array
	it "imports consoleHandler", ->
		expect(sink.indexOf (require "./consoleHandler")).not.toEqual -1
