describe "information", ->
	rewire = require "rewire"
	information = undefined
	beforeEach ->
		information = rewire "./information"
	it "imports sink", -> expect(information.__get__ "sink").toBe require "./sink"
	describe "on calling", ->
		mockSink = undefined
		beforeEach ->
			mockSink = [
					jasmine.createSpy "handler a"
					jasmine.createSpy "handler b"
					jasmine.createSpy "handler c"
				]
			information.__set__ "sink", mockSink
			information "Test message"
		it "passes the message to every handler in the sink", ->
			expect(mockSink[0]).toHaveBeenCalledWith "information", "Test message"
			expect(mockSink[1]).toHaveBeenCalledWith "information", "Test message"
			expect(mockSink[2]).toHaveBeenCalledWith "information", "Test message"
