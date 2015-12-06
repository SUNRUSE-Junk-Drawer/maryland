describe "apply", ->
	rewire = require "rewire"
	apply = undefined
	beforeEach ->
		apply = rewire "./apply"
	it "imports logs/warning", -> expect(apply.__get__ "warning").toBe require "./../logs/warning"
	describe "on calling", ->
		mockWarning = database = patch = undefined
		beforeEach ->
			mockWarning = jasmine.createSpy "warning"
			apply.__set__ "warning", mockWarning

			database = 
				objectUnmodifiedByPatch:
					subIntegerUnmodifiedByPatch: 362326
					subTrueBooleanUnmodifiedByPatch: true
					subFalseBooleanUnmodifiedByPatch: false
					subNullUnmodifiedByPatch: null
					subStringUnmodifiedByPatch: "test unmodified substring"
					subArrayUnmodifiedByPatch: [8, 4389, 27]
				integerUnmodifiedByPatch: 84383
				trueBooleanUnmodifiedByPatch: true
				falseBooleanUnmodifiedByPatch: false
				nullUnmodifiedByPatch: null
				stringUnmodifiedByPatch: "test unmodified string"
				arrayUnmodifiedByPatch: [8, 4389, 27]
				updatedByPatch:
					subObjectUnmodifiedByPatch:
						a: 50
						b: 77
					subIntegerUnmodifiedByPatch: 253262
					subTrueBooleanUnmodifiedByPatch: true
					subFalseBooleanUnmodifiedByPatch: false
					subNullUnmodifiedByPatch: null
					subStringUnmodifiedByPatch: "test unmodified substring"
					subArrayUnmodifiedByPatch: [8, 4389, 27]
					subArrayUpdatedByPatch: [979, 1236786, 123768, 214]
					subIntegerUpdatedByPatch: 98696
					subTrueBooleanUpdatedByPatch: true
					subFalseBooleanUpdatedByPatch: false
					subStringUpdatedByPatch: "test unupdated substring"
					subObjectDeletedByPatch: 
						a: 239
						b: 538
					subIntegerDeletedByPatch: 3897
					subTrueBooleanDeletedByPatch: true
					subFalseBooleanDeletedByPatch: false
					subArrayDeletedByPatch: [489, 525, 6246]
					subStringDeletedByPatch: "test unmodified substring"
					subCannotReplace:
						integerToObject: 2323987
						stringToObject: "test ignored string"
						falseToObject: false
						trueToObject: true
						arrayToObject: [234, 43636, 36]
						objectToInteger: 
							a: 3472934
						objectToString: 
							a: 3472934
						objectToFalse: 
							a: 3472934
						objectToTrue: 
							a: 3472934
						objectToArray: 
							a: 3472934
					subCannotUpdateNull: null
				arrayUpdatedByPatch: [979, 1236786, 123768, 214]
				integerUpdatedByPatch: 120
				trueBooleanUpdatedByPatch: true
				falseBooleanUpdatedByPatch: false
				stringUpdatedByPatch: "test unupdated string"
				objectDeletedByPatch: 
					a: 239
					b: 538
				integerDeletedByPatch: 3897
				trueBooleanDeletedByPatch: true
				falseBooleanDeletedByPatch: false
				arrayDeletedByPatch: [489, 525, 6246]
				cannotReplace:
					integerToObject: 2323987
					stringToObject: "test ignored string"
					falseToObject: false
					trueToObject: true
					arrayToObject: [234, 43636, 36]
					objectToInteger: 
						a: 3472934
					objectToString: 
						a: 3472934
					objectToFalse: 
						a: 3472934
					objectToTrue: 
						a: 3472934
					objectToArray: 
						a: 3472934
				cannotUpdateNull: null

		describe "when the patch attempts to replace", ->
			beforeEach ->
				database = 
					rootUnchangedInteger: 39283
					rootUnchangedTrue: true
					rootUnchangedFalse: false
					rootUnchangedString: "test unchanged string"
					rootUnchangedArray: [439, 234767, 237]
					rootUnchangedNull: null
					unchangedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
						nestedDeletedNull: null

			describe "an integer with an object", ->
				beforeEach ->
					patch = 
						rootUnchangedInteger: 
							a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at rootUnchangedInteger with an object"

			describe "true with an object", ->
				beforeEach ->
					patch = 
						rootUnchangedTrue: 
							a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at rootUnchangedTrue with an object"

			describe "false with an object", ->
				beforeEach ->
					patch = 
						rootUnchangedFalse: 
							a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at rootUnchangedFalse with an object"
			describe "string with an object", ->
				beforeEach ->
					patch = 
						rootUnchangedString: 
							a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at rootUnchangedString with an object"
			describe "an array with an object", ->
				beforeEach ->
					patch = 
						rootUnchangedArray: 
							a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at rootUnchangedArray with an object"

			describe "a nested integer with an object", ->
				beforeEach ->
					patch = 
						unchangedObject:
							nestedUnchangedInteger: 
								a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at unchangedObject.nestedUnchangedInteger with an object"

			describe "nested true with an object", ->
				beforeEach ->
					patch = 
						unchangedObject:
							nestedUnchangedTrue: 
								a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at unchangedObject.nestedUnchangedTrue with an object"

			describe "nested false with an object", ->
				beforeEach ->
					patch = 
						unchangedObject:
							nestedUnchangedFalse: 
								a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at unchangedObject.nestedUnchangedFalse with an object"
			describe "a nested string with an object", ->
				beforeEach ->
					patch = 
						unchangedObject:
							nestedUnchangedString: 
								a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at unchangedObject.nestedUnchangedString with an object"
			describe "a nested array with an object", ->
				beforeEach ->
					patch = 
						unchangedObject:
							nestedUnchangedArray: 
								a: 2387

				it "does not log any warnings", ->
					expect(mockWarning).not.toHaveBeenCalled()

				it "does not modify the database", ->
					try
						apply database, patch

					expect(database).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> apply database, patch).toThrowError "The patch attempted to replace the value at unchangedObject.nestedUnchangedArray with an object"

			describe "an object", ->
				describe "with an integer", ->
					beforeEach ->
						patch = 
							unchangedObject: 354364363

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject with a value"

				describe "with true", ->
					beforeEach ->
						patch = 
							unchangedObject: true

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject with a value"

				describe "with false", ->
					beforeEach ->
						patch = 
							unchangedObject: false

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject with a value"

				describe "with a string", ->
					beforeEach ->
						patch = 
							unchangedObject: "test string"

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject with a value"

				describe "with an array", ->
					beforeEach ->
						patch = 
							unchangedObject: [32, 36346, 235325]

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject with a value"

			describe "a nested object", ->
				beforeEach ->
					database = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null
							nestedUnchangedObject:
								a: 4823749

				describe "with an integer", ->
					beforeEach ->
						patch = 
							unchangedObject: 
								nestedUnchangedObject: 354364363

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null
								nestedUnchangedObject:
									a: 4823749

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject.nestedUnchangedObject with a value"

				describe "with true", ->
					beforeEach ->
						patch = 
							unchangedObject: 
								nestedUnchangedObject: true

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null
								nestedUnchangedObject:
									a: 4823749

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject.nestedUnchangedObject with a value"

				describe "with false", ->
					beforeEach ->
						patch = 
							unchangedObject: 
								nestedUnchangedObject: false

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null
								nestedUnchangedObject:
									a: 4823749

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject.nestedUnchangedObject with a value"

				describe "with a string", ->
					beforeEach ->
						patch = 
							unchangedObject: 
								nestedUnchangedObject: "test string"

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null
								nestedUnchangedObject:
									a: 4823749

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject.nestedUnchangedObject with a value"

				describe "with an array", ->
					beforeEach ->
						patch = 
							unchangedObject: 
								nestedUnchangedObject: [32, 36346, 235325]

					it "does not log any warnings", ->
						expect(mockWarning).not.toHaveBeenCalled()

					it "does not modify the database", ->
						try
							apply database, patch

						expect(database).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null
								nestedUnchangedObject:
									a: 4823749

					it "throws an error", ->
						expect(-> apply database, patch).toThrowError "The patch attempted to replace the object at unchangedObject.nestedUnchangedObject with a value"
			
		describe "when the patch is null", ->
			beforeEach ->
				apply database, null
	
			it "does not modify the database", ->
				expect(database).toEqual
					objectUnmodifiedByPatch:
						subIntegerUnmodifiedByPatch: 362326
						subTrueBooleanUnmodifiedByPatch: true
						subFalseBooleanUnmodifiedByPatch: false
						subNullUnmodifiedByPatch: null
						subStringUnmodifiedByPatch: "test unmodified substring"
						subArrayUnmodifiedByPatch: [8, 4389, 27]
					integerUnmodifiedByPatch: 84383
					trueBooleanUnmodifiedByPatch: true
					falseBooleanUnmodifiedByPatch: false
					nullUnmodifiedByPatch: null
					stringUnmodifiedByPatch: "test unmodified string"
					arrayUnmodifiedByPatch: [8, 4389, 27]
					updatedByPatch:
						subObjectUnmodifiedByPatch:
							a: 50
							b: 77
						subIntegerUnmodifiedByPatch: 253262
						subTrueBooleanUnmodifiedByPatch: true
						subFalseBooleanUnmodifiedByPatch: false
						subNullUnmodifiedByPatch: null
						subStringUnmodifiedByPatch: "test unmodified substring"
						subArrayUnmodifiedByPatch: [8, 4389, 27]
						subArrayUpdatedByPatch: [979, 1236786, 123768, 214]
						subIntegerUpdatedByPatch: 98696
						subTrueBooleanUpdatedByPatch: true
						subFalseBooleanUpdatedByPatch: false
						subStringUpdatedByPatch: "test unupdated substring"
						subObjectDeletedByPatch: 
							a: 239
							b: 538
						subIntegerDeletedByPatch: 3897
						subTrueBooleanDeletedByPatch: true
						subFalseBooleanDeletedByPatch: false
						subArrayDeletedByPatch: [489, 525, 6246]
						subStringDeletedByPatch: "test unmodified substring"
						subCannotReplace:
							integerToObject: 2323987
							stringToObject: "test ignored string"
							falseToObject: false
							trueToObject: true
							arrayToObject: [234, 43636, 36]
							objectToInteger: 
								a: 3472934
							objectToString: 
								a: 3472934
							objectToFalse: 
								a: 3472934
							objectToTrue: 
								a: 3472934
							objectToArray: 
								a: 3472934
						subCannotUpdateNull: null
					arrayUpdatedByPatch: [979, 1236786, 123768, 214]
					integerUpdatedByPatch: 120
					trueBooleanUpdatedByPatch: true
					falseBooleanUpdatedByPatch: false
					stringUpdatedByPatch: "test unupdated string"
					objectDeletedByPatch: 
						a: 239
						b: 538
					integerDeletedByPatch: 3897
					trueBooleanDeletedByPatch: true
					falseBooleanDeletedByPatch: false
					arrayDeletedByPatch: [489, 525, 6246]
					cannotReplace:
						integerToObject: 2323987
						stringToObject: "test ignored string"
						falseToObject: false
						trueToObject: true
						arrayToObject: [234, 43636, 36]
						objectToInteger: 
							a: 3472934
						objectToString: 
							a: 3472934
						objectToFalse: 
							a: 3472934
						objectToTrue: 
							a: 3472934
						objectToArray: 
							a: 3472934
					cannotUpdateNull: null

		describe "when the patch is non-null", ->
			beforeEach ->
				patch = 
					createdByPatch:
						created: true
						subArrayCreatedByPatch: [80, 1129, 24878]
						subIntegerCreatedByPatch: 23868
						subTrueBooleanCreatedByPatch: true
						subFalseBooleanCreatedByPatch: false
						subStringCreatedByPatch: "test created substring"
						subCannotUpdateUndefined:
							a: 234
							b: 5387
					updatedByPatch:
						subArrayUpdatedByPatch: [80, 1129, 24878]
						subIntegerUpdatedByPatch: 23868
						subTrueBooleanUpdatedByPatch: false
						subFalseBooleanUpdatedByPatch: true
						subStringUpdatedByPatch: "test updated substring"
						subArrayCreatedByPatch: [80, 1129, 24878]
						subIntegerCreatedByPatch: 23868
						subTrueBooleanCreatedByPatch: true
						subFalseBooleanCreatedByPatch: false
						subStringCreatedByPatch: "test created substring"
						subObjectDeletedByPatch: null
						subIntegerDeletedByPatch: null
						subTrueBooleanDeletedByPatch: null
						subFalseBooleanDeletedByPatch: null
						subArrayDeletedByPatch: null
						subStringDeletedByPatch: null
						subCannotReplace:
							created: true
							integerToObject: 
								a: 3479247
							stringToObject: 
								a: 3479247
							falseToObject: 
								a: 3479247
							trueToObject: 
								a: 3479247
							arrayToObject: 
								a: 3479247
							objectToInteger: 65785
							objectToString: "test ignored replacement string"
							objectToFalse: false
							objectToTrue: true
							objectToArray: [424, 45, 3, 4636, 35]
						subCannotUpdateUndefined:
							a: 234
							b: 5387
						subCannotUpdateNull:
							a: 234
							b: 5387	
					arrayCreatedByPatch: [80, 1129, 24878]
					integerCreatedByPatch: 23868
					trueBooleanCreatedByPatch: true
					falseBooleanCreatedByPatch: false
					stringCreatedByPatch: "test created string"
					arrayUpdatedByPatch: [80, 1129, 24878]
					integerUpdatedByPatch: 23868
					trueBooleanUpdatedByPatch: false
					falseBooleanUpdatedByPatch: true
					stringUpdatedByPatch: "test updated string"
					objectDeletedByPatch: null
					integerDeletedByPatch: null
					trueBooleanDeletedByPatch: null
					falseBooleanDeletedByPatch: null
					stringDeletedByPatch: null
					arrayDeletedByPatch: null
					cannotReplace:
						created: true
						integerToObject: 
							a: 3479247
						stringToObject: 
							a: 3479247
						falseToObject: 
							a: 3479247
						trueToObject: 
							a: 3479247
						arrayToObject: 
							a: 3479247
						objectToInteger: 65785
						objectToString: "test ignored replacement string"
						objectToFalse: false
						objectToTrue: true
						objectToArray: [424, 45, 3, 4636, 35]
					cannotUpdateUndefined:
						a: 234
						b: 5387
					cannotUpdateNull:
						a: 234
						b: 5387	

				apply database, patch

			it "does not modify the patch", ->
				expect(patch).toEqual
					createdByPatch:
						created: true
						subArrayCreatedByPatch: [80, 1129, 24878]
						subIntegerCreatedByPatch: 23868
						subTrueBooleanCreatedByPatch: true
						subFalseBooleanCreatedByPatch: false
						subStringCreatedByPatch: "test created substring"
						subCannotUpdateUndefined:
							a: 234
							b: 5387
					updatedByPatch:
						subArrayUpdatedByPatch: [80, 1129, 24878]
						subIntegerUpdatedByPatch: 23868
						subTrueBooleanUpdatedByPatch: false
						subFalseBooleanUpdatedByPatch: true
						subStringUpdatedByPatch: "test updated substring"
						subArrayCreatedByPatch: [80, 1129, 24878]
						subIntegerCreatedByPatch: 23868
						subTrueBooleanCreatedByPatch: true
						subFalseBooleanCreatedByPatch: false
						subStringCreatedByPatch: "test created substring"
						subObjectDeletedByPatch: null
						subIntegerDeletedByPatch: null
						subTrueBooleanDeletedByPatch: null
						subFalseBooleanDeletedByPatch: null
						subArrayDeletedByPatch: null
						subStringDeletedByPatch: null
						subCannotReplace:
							created: true
							integerToObject: 
								a: 3479247
							stringToObject: 
								a: 3479247
							falseToObject: 
								a: 3479247
							trueToObject: 
								a: 3479247
							arrayToObject: 
								a: 3479247
							objectToInteger: 65785
							objectToString: "test ignored replacement string"
							objectToFalse: false
							objectToTrue: true
							objectToArray: [424, 45, 3, 4636, 35]
						subCannotUpdateUndefined:
							a: 234
							b: 5387
						subCannotUpdateNull:
							a: 234
							b: 5387	

					arrayCreatedByPatch: [80, 1129, 24878]
					integerCreatedByPatch: 23868
					trueBooleanCreatedByPatch: true
					falseBooleanCreatedByPatch: false
					stringCreatedByPatch: "test created string"
					arrayUpdatedByPatch: [80, 1129, 24878]
					integerUpdatedByPatch: 23868
					trueBooleanUpdatedByPatch: false
					falseBooleanUpdatedByPatch: true
					stringUpdatedByPatch: "test updated string"
					objectDeletedByPatch: null
					integerDeletedByPatch: null
					trueBooleanDeletedByPatch: null
					falseBooleanDeletedByPatch: null
					stringDeletedByPatch: null
					arrayDeletedByPatch: null
					cannotReplace:
						created: true
						integerToObject: 
							a: 3479247
						stringToObject: 
							a: 3479247
						falseToObject: 
							a: 3479247
						trueToObject: 
							a: 3479247
						arrayToObject: 
							a: 3479247
						objectToInteger: 65785
						objectToString: "test ignored replacement string"
						objectToFalse: false
						objectToTrue: true
						objectToArray: [424, 45, 3, 4636, 35]
					cannotUpdateUndefined:
						a: 234
						b: 5387
					cannotUpdateNull:
						a: 234
						b: 5387	
			describe "when the patch attempts to create objects which already exist in the database", ->
				it "does not replace the object already present", ->
					expect(database.cannotReplace).toEqual
						integerToObject: 2323987
						stringToObject: "test ignored string"
						falseToObject: false
						trueToObject: true
						arrayToObject: [234, 43636, 36]
						objectToInteger: 
							a: 3472934
						objectToString: 
							a: 3472934
						objectToFalse: 
							a: 3472934
						objectToTrue: 
							a: 3472934
						objectToArray: 
							a: 3472934
				it "generates a warning", ->
					expect(mockWarning).toHaveBeenCalledWith "The patch attempted to create the object cannotReplace, but it already existed in the database.  It has been skipped."
				describe "nested in updates", ->
					it "does not replace the object already present", ->
						expect(database.updatedByPatch.subCannotReplace).toEqual
							integerToObject: 2323987
							stringToObject: "test ignored string"
							falseToObject: false
							trueToObject: true
							arrayToObject: [234, 43636, 36]
							objectToInteger: 
								a: 3472934
							objectToString: 
								a: 3472934
							objectToFalse: 
								a: 3472934
							objectToTrue: 
								a: 3472934
							objectToArray: 
								a: 3472934
					it "generates a warning", ->
						expect(mockWarning).toHaveBeenCalledWith "The patch attempted to create the object updatedByPatch.subCannotReplace, but it already existed in the database.  It has been skipped."
			describe "when the patch attempts to update null objects", ->
				it "does not change the property", ->
					expect(database.cannotUpdateNull).toBeNull()
				it "generates a warning", ->
					expect(mockWarning).toHaveBeenCalledWith "The patch attempted to update the object cannotUpdateNull, but it was deleted by a previous patch.  It has been skipped."
				describe "nested in updates", ->
					it "does not change the property", ->
						expect(database.updatedByPatch.subCannotUpdateNull).toBeNull()
					it "generates a warning", ->
						expect(mockWarning).toHaveBeenCalledWith "The patch attempted to update the object updatedByPatch.subCannotUpdateNull, but it was deleted by a previous patch.  It has been skipped."
			describe "when the patch attempts to update undefined objects", ->
				it "does not set the property", ->
					expect(database.cannotUpdateUndefined).toBeUndefined()
				it "generates a warning", ->
					expect(mockWarning).toHaveBeenCalledWith "The patch attempted to update the object cannotUpdateUndefined, but it does not exist.  It has been skipped."
				describe "nested in updates", ->
					it "does not set the property", ->
						expect(database.updatedByPatch.subCannotUpdateUndefined).toBeUndefined()
					it "generates a warning", ->
						expect(mockWarning).toHaveBeenCalledWith "The patch attempted to update the object updatedByPatch.subCannotUpdateUndefined, but it does not exist.  It has been skipped."
				describe "nested in creates", ->
					it "does not set the property", ->
						expect(database.createdByPatch.subCannotUpdateUndefined).toBeUndefined()
					it "generates a warning", ->
						expect(mockWarning).toHaveBeenCalledWith "The patch attempted to update the object createdByPatch.subCannotUpdateUndefined, but it does not exist.  It has been skipped."
			describe "can add", ->
				# Objects are covered below in nested created/updated object.
				it "arrays", -> expect(database.arrayCreatedByPatch).toEqual [80, 1129, 24878]
				it "arrays do not share a reference", -> expect(database.arrayCreatedByPatch).not.toBe patch.arrayCreatedByPatch
				it "integers", -> expect(database.integerCreatedByPatch).toEqual 23868
				it "booleans (true)", -> expect(database.trueBooleanCreatedByPatch).toBe true
				it "booleans (false)", -> expect(database.falseBooleanCreatedByPatch).toBe false
				it "strings", -> expect(database.stringCreatedByPatch).toEqual "test created string"
				describe "nested in created object", ->
					it "does not include the created flag", -> expect(database.createdByPatch.created).toBeUndefined()
					it "arrays", -> expect(database.createdByPatch.subArrayCreatedByPatch).toEqual [80, 1129, 24878]
					it "arrays do not share a reference", -> expect(database.createdByPatch.subArrayCreatedByPatch).not.toBe patch.createdByPatch.subArrayCreatedByPatch
					it "integers", -> expect(database.createdByPatch.subIntegerCreatedByPatch).toEqual 23868
					it "booleans (true)", -> expect(database.createdByPatch.subTrueBooleanCreatedByPatch).toBe true
					it "booleans (false)", -> expect(database.createdByPatch.subFalseBooleanCreatedByPatch).toBe false
					it "strings", -> expect(database.createdByPatch.subStringCreatedByPatch).toEqual "test created substring"
				describe "nested in updated object", ->
					it "arrays", -> expect(database.updatedByPatch.subArrayCreatedByPatch).toEqual [80, 1129, 24878]
					it "arrays do not share a reference", -> expect(database.updatedByPatch.subArrayCreatedByPatch).not.toBe patch.updatedByPatch.subArrayCreatedByPatch
					it "integers", -> expect(database.updatedByPatch.subIntegerCreatedByPatch).toEqual 23868
					it "booleans (true)", -> expect(database.updatedByPatch.subTrueBooleanCreatedByPatch).toBe true
					it "booleans (false)", -> expect(database.updatedByPatch.subFalseBooleanCreatedByPatch).toBe false
					it "strings", -> expect(database.updatedByPatch.subStringCreatedByPatch).toEqual "test created substring"
			describe "can overwrite", ->
				# Objects are covered below in nested updated object.
				it "arrays", -> expect(database.arrayUpdatedByPatch).toEqual [80, 1129, 24878]
				it "arrays do not share a reference", -> expect(database.arrayUpdatedByPatch).not.toBe patch.arrayUpdatedByPatch
				it "integers", -> expect(database.integerUpdatedByPatch).toEqual 23868
				it "booleans (true -> false)", -> expect(database.trueBooleanUpdatedByPatch).toBe false
				it "booleans (false -> true)", -> expect(database.falseBooleanUpdatedByPatch).toBe true
				it "strings", -> expect(database.stringUpdatedByPatch).toEqual "test updated string"
				describe "nested in updated object", ->
					it "arrays", -> expect(database.updatedByPatch.subArrayUpdatedByPatch).toEqual [80, 1129, 24878]
					it "arrays do not share a reference", -> expect(database.updatedByPatch.subArrayUpdatedByPatch).not.toBe patch.updatedByPatch.subArrayUpdatedByPatch
					it "integers", -> expect(database.updatedByPatch.subIntegerUpdatedByPatch).toEqual 23868
					it "booleans (true -> false)", -> expect(database.updatedByPatch.subTrueBooleanUpdatedByPatch).toBe false
					it "booleans (false -> true)", -> expect(database.updatedByPatch.subFalseBooleanUpdatedByPatch).toBe true
					it "strings", -> expect(database.updatedByPatch.subStringUpdatedByPatch).toEqual "test updated substring"
			describe "can delete", ->
				it "objects", -> expect(database.objectDeletedByPatch).toBeNull()
				it "arrays", -> expect(database.arrayDeletedByPatch).toBeNull()
				it "integers", -> expect(database.integerDeletedByPatch).toBeNull()
				it "booleans (true)", -> expect(database.trueBooleanDeletedByPatch).toBeNull()
				it "booleans (false)", -> expect(database.falseBooleanDeletedByPatch).toBeNull()
				it "strings", -> expect(database.stringDeletedByPatch).toBeNull()
				describe "nested in updated object", ->
					it "objects", -> expect(database.updatedByPatch.subObjectDeletedByPatch).toBeNull()
					it "arrays", -> expect(database.updatedByPatch.subArrayDeletedByPatch).toBeNull()
					it "integers", -> expect(database.updatedByPatch.subIntegerDeletedByPatch).toBeNull()
					it "booleans (true)", -> expect(database.updatedByPatch.subTrueBooleanDeletedByPatch).toBeNull()
					it "booleans (false)", -> expect(database.updatedByPatch.subFalseBooleanDeletedByPatch).toBeNull()
					it "strings", -> expect(database.updatedByPatch.subStringDeletedByPatch).toBeNull()
			describe "does not modify unpatched", ->
				# Objects are covered below in nested in unupdated object.
				it "integers", -> expect(database.integerUnmodifiedByPatch).toEqual 84383
				it "booleans (true)", -> expect(database.trueBooleanUnmodifiedByPatch).toBe true
				it "booleans (false)", -> expect(database.falseBooleanUnmodifiedByPatch).toBe false
				it "strings", -> expect(database.stringUnmodifiedByPatch).toEqual "test unmodified string"
				it "arrays", -> expect(database.arrayUnmodifiedByPatch).toEqual [8, 4389, 27]
				it "null", -> expect(database.nullUnmodifiedByPatch).toBeNull()
				describe "nested in updated object", ->
					it "integers", -> expect(database.updatedByPatch.subIntegerUnmodifiedByPatch).toEqual 253262
					it "booleans (true)", -> expect(database.updatedByPatch.subTrueBooleanUnmodifiedByPatch).toBe true
					it "booleans (false)", -> expect(database.updatedByPatch.subFalseBooleanUnmodifiedByPatch).toBe false
					it "strings", -> expect(database.updatedByPatch.subStringUnmodifiedByPatch).toEqual "test unmodified substring"
					it "arrays", -> expect(database.updatedByPatch.subArrayUnmodifiedByPatch).toEqual [8, 4389, 27]
					it "null", -> expect(database.updatedByPatch.subNullUnmodifiedByPatch).toBeNull()
				describe "nested in unupdated object", ->
					it "integers", -> expect(database.objectUnmodifiedByPatch.subIntegerUnmodifiedByPatch).toEqual 362326
					it "booleans (true)", -> expect(database.objectUnmodifiedByPatch.subTrueBooleanUnmodifiedByPatch).toBe true
					it "booleans (false)", -> expect(database.objectUnmodifiedByPatch.subFalseBooleanUnmodifiedByPatch).toBe false
					it "strings", -> expect(database.objectUnmodifiedByPatch.subStringUnmodifiedByPatch).toEqual "test unmodified substring"
					it "arrays", -> expect(database.objectUnmodifiedByPatch.subArrayUnmodifiedByPatch).toEqual [8, 4389, 27]
					it "null", -> expect(database.objectUnmodifiedByPatch.subNullUnmodifiedByPatch).toBeNull()
