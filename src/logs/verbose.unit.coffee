describe "verbose", ->
	rewire = require "rewire"
	verbose = undefined
	beforeEach ->
		verbose = rewire "./verbose"
	it "imports sink", -> expect(verbose.__get__ "sink").toBe require "./sink"
	describe "on calling", ->
		mockSink = undefined
		beforeEach ->
			mockSink = [
					jasmine.createSpy "handler a"
					jasmine.createSpy "handler b"
					jasmine.createSpy "handler c"
				]
			verbose.__set__ "sink", mockSink
			verbose "Test message"
		it "passes the message to every handler in the sink", ->
			expect(mockSink[0]).toHaveBeenCalledWith "verbose", "Test message"
			expect(mockSink[1]).toHaveBeenCalledWith "verbose", "Test message"
			expect(mockSink[2]).toHaveBeenCalledWith "verbose", "Test message"
