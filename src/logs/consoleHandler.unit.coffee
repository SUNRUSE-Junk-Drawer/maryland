describe "consoleHandler", ->
	rewire = require "rewire"
	mockConsole = consoleHandler = undefined
	beforeEach ->
		consoleHandler = rewire "./consoleHandler"
		mockConsole = 
			log: jasmine.createSpy "log"
			info: jasmine.createSpy "info"
			warning: jasmine.createSpy "warning"
			error: jasmine.createSpy "error"
		consoleHandler.__set__ "console", mockConsole
	describe "on calling with a severity of \"verbose\"", ->
		beforeEach -> consoleHandler "verbose", "A message to log"
		it "calls console.log", ->
			expect(mockConsole.log).toHaveBeenCalledWith "A message to log"
		it "does not call any other methods", ->
			expect(mockConsole.info).not.toHaveBeenCalled()
			expect(mockConsole.warning).not.toHaveBeenCalled()
			expect(mockConsole.error).not.toHaveBeenCalled()
	describe "on calling with a severity of \"information\"", ->
		beforeEach -> consoleHandler "information", "A message to log"
		it "calls console.info", ->
			expect(mockConsole.info).toHaveBeenCalledWith "A message to log"
		it "does not call any other methods", ->
			expect(mockConsole.log).not.toHaveBeenCalled()
			expect(mockConsole.warning).not.toHaveBeenCalled()
			expect(mockConsole.error).not.toHaveBeenCalled()
	describe "on calling with a severity of \"warning\"", ->
		beforeEach -> consoleHandler "warning", "A message to log"
		it "calls console.warning", ->
			expect(mockConsole.warning).toHaveBeenCalledWith "A message to log"
		it "does not call any other methods", ->
			expect(mockConsole.log).not.toHaveBeenCalled()
			expect(mockConsole.info).not.toHaveBeenCalled()
			expect(mockConsole.error).not.toHaveBeenCalled()
	describe "on calling with a severity of \"error\"", ->
		beforeEach -> consoleHandler "error", "A message to log"
		it "calls console.error", ->
			expect(mockConsole.error).toHaveBeenCalledWith "A message to log"
		it "does not call any other methods", ->
			expect(mockConsole.log).not.toHaveBeenCalled()
			expect(mockConsole.info).not.toHaveBeenCalled()
			expect(mockConsole.warning).not.toHaveBeenCalled()
