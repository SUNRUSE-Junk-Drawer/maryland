describe "warning", ->
	rewire = require "rewire"
	warning = undefined
	beforeEach ->
		warning = rewire "./warning"
	it "imports sink", -> expect(warning.__get__ "sink").toBe require "./sink"
	describe "on calling", ->
		mockSink = undefined
		beforeEach ->
			mockSink = [
					jasmine.createSpy "handler a"
					jasmine.createSpy "handler b"
					jasmine.createSpy "handler c"
				]
			warning.__set__ "sink", mockSink
			warning "Test message"
		it "passes the message to every handler in the sink", ->
			expect(mockSink[0]).toHaveBeenCalledWith "warning", "Test message"
			expect(mockSink[1]).toHaveBeenCalledWith "warning", "Test message"
			expect(mockSink[2]).toHaveBeenCalledWith "warning", "Test message"
