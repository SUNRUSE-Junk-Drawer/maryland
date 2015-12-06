describe "error", ->
	rewire = require "rewire"
	error = undefined
	beforeEach ->
		error = rewire "./error"
	it "imports sink", -> expect(error.__get__ "sink").toBe require "./sink"
	describe "on calling", ->
		mockSink = undefined
		beforeEach ->
			mockSink = [
					jasmine.createSpy "handler a"
					jasmine.createSpy "handler b"
					jasmine.createSpy "handler c"
				]
			error.__set__ "sink", mockSink
			error "Test message"
		it "passes the message to every handler in the sink", ->
			expect(mockSink[0]).toHaveBeenCalledWith "error", "Test message"
			expect(mockSink[1]).toHaveBeenCalledWith "error", "Test message"
			expect(mockSink[2]).toHaveBeenCalledWith "error", "Test message"
