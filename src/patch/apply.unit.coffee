describe "apply", ->
	rewire = require "rewire"
	apply = undefined
	beforeEach ->
		apply = rewire "./apply"
	it "imports logs/warning", -> expect(apply.__get__ "warning").toBe require "./../logs/warning"
	it "imports logs/error", -> expect(apply.__get__ "error").toBe require "./../logs/error"
	describe "on calling", ->
		mockError = mockWarning = database = patch = undefined
		beforeEach ->
			mockWarning = jasmine.createSpy "warning"
			apply.__set__ "warning", mockWarning
			mockError = jasmine.createSpy "error"
			apply.__set__ "error", mockError

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
						a: 23
						b: 8379
					subCannotUpdateNull: null
					subObjectCannotReplaceWithInteger:
						a: 233987
						b: 2782
					subObjectCannotReplaceWithTrue:
						a: 233987
						b: 2782
					subObjectCannotReplaceWithFalse:
						a: 233987
						b: 2782
					subObjectCannotReplaceWithArray:
						a: 233987
						b: 2782
					subObjectCannotReplaceWithString:
						a: 233987
						b: 2782
					subIntegerCannotReplaceWithObject: 34793
					subTrueCannotReplaceWithObject: true			
					subFalseCannotReplaceWithObject: false
					subArrayCannotReplaceWithObject: [4784, 3492]
					subStringCannotReplaceWithObject: "test unreplaced string"
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
					a: 23
					b: 8379
				cannotUpdateNull: null
				objectCannotReplaceWithInteger:
					a: 233987
					b: 2782
				objectCannotReplaceWithTrue:
					a: 233987
					b: 2782
				objectCannotReplaceWithFalse:
					a: 233987
					b: 2782
				objectCannotReplaceWithArray:
					a: 233987
					b: 2782
				objectCannotReplaceWithString:
					a: 233987
					b: 2782
				integerCannotReplaceWithObject: 34793
				trueCannotReplaceWithObject: true			
				falseCannotReplaceWithObject: false
				arrayCannotReplaceWithObject: [4784, 3492]
				stringCannotReplaceWithObject: "test unreplaced string"


			
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
							a: 23
							b: 8379
						subCannotUpdateNull: null
						subObjectCannotReplaceWithInteger:
							a: 233987
							b: 2782
						subObjectCannotReplaceWithTrue:
							a: 233987
							b: 2782
						subObjectCannotReplaceWithFalse:
							a: 233987
							b: 2782
						subObjectCannotReplaceWithArray:
							a: 233987
							b: 2782
						subObjectCannotReplaceWithString:
							a: 233987
							b: 2782
						subIntegerCannotReplaceWithObject: 34793
						subTrueCannotReplaceWithObject: true			
						subFalseCannotReplaceWithObject: false
						subArrayCannotReplaceWithObject: [4784, 3492]
						subStringCannotReplaceWithObject: "test unreplaced string"
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
						a: 23
						b: 8379
					cannotUpdateNull: null
					objectCannotReplaceWithInteger:
						a: 233987
						b: 2782
					objectCannotReplaceWithTrue:
						a: 233987
						b: 2782
					objectCannotReplaceWithFalse:
						a: 233987
						b: 2782
					objectCannotReplaceWithArray:
						a: 233987
						b: 2782
					objectCannotReplaceWithString:
						a: 233987
						b: 2782
					integerCannotReplaceWithObject: 34793
					trueCannotReplaceWithObject: true			
					falseCannotReplaceWithObject: false
					arrayCannotReplaceWithObject: [4784, 3492]
					stringCannotReplaceWithObject: "test unreplaced string"

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
							b: 786
							c: 383
						subCannotUpdateUndefined:
							a: 234
							b: 5387
						subCannotUpdateNull:
							a: 234
							b: 5387	
						subObjectCannotReplaceWithInteger: 67868
						subObjectCannotReplaceWithTrue: true
						subObjectCannotReplaceWithFalse: false
						subObjectCannotReplaceWithArray: [2382, 2362]
						subObjectCannotReplaceWithString: "test misreplacement"
						subIntegerCannotReplaceWithObject: 
							a: 34739
							b: 3479
						subTrueCannotReplaceWithObject:
							a: 34739
							b: 3479			
						subFalseCannotReplaceWithObject:
							a: 34739
							b: 3479
						subArrayCannotReplaceWithObject: 
							a: 34739
							b: 3479
						subStringCannotReplaceWithObject:
							a: 34739
							b: 3479
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
						b: 786
						c: 383
					cannotUpdateUndefined:
						a: 234
						b: 5387
					cannotUpdateNull:
						a: 234
						b: 5387	
					objectCannotReplaceWithInteger: 67868
					objectCannotReplaceWithTrue: true
					objectCannotReplaceWithFalse: false
					objectCannotReplaceWithArray: [2382, 2362]
					objectCannotReplaceWithString: "test misreplacement"
					integerCannotReplaceWithObject: 
						a: 34739
						b: 3479
					trueCannotReplaceWithObject:
						a: 34739
						b: 3479			
					falseCannotReplaceWithObject:
						a: 34739
						b: 3479
					arrayCannotReplaceWithObject: 
						a: 34739
						b: 3479
					stringCannotReplaceWithObject:
						a: 34739
						b: 3479

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
							b: 786
							c: 383
						subCannotUpdateUndefined:
							a: 234
							b: 5387
						subCannotUpdateNull:
							a: 234
							b: 5387	
						subObjectCannotReplaceWithInteger: 67868
						subObjectCannotReplaceWithTrue: true
						subObjectCannotReplaceWithFalse: false
						subObjectCannotReplaceWithArray: [2382, 2362]
						subObjectCannotReplaceWithString: "test misreplacement"
						subIntegerCannotReplaceWithObject: 
							a: 34739
							b: 3479
						subTrueCannotReplaceWithObject:
							a: 34739
							b: 3479			
						subFalseCannotReplaceWithObject:
							a: 34739
							b: 3479
						subArrayCannotReplaceWithObject: 
							a: 34739
							b: 3479
						subStringCannotReplaceWithObject:
							a: 34739
							b: 3479
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
						b: 786
						c: 383
					cannotUpdateUndefined:
						a: 234
						b: 5387
					cannotUpdateNull:
						a: 234
						b: 5387	
					objectCannotReplaceWithInteger: 67868
					objectCannotReplaceWithTrue: true
					objectCannotReplaceWithFalse: false
					objectCannotReplaceWithArray: [2382, 2362]
					objectCannotReplaceWithString: "test misreplacement"
					integerCannotReplaceWithObject: 
						a: 34739
						b: 3479
					trueCannotReplaceWithObject:
						a: 34739
						b: 3479			
					falseCannotReplaceWithObject:
						a: 34739
						b: 3479
					arrayCannotReplaceWithObject: 
						a: 34739
						b: 3479
					stringCannotReplaceWithObject:
						a: 34739
						b: 3479
			describe "when the patch attempts to create objects which already exist in the database", ->
				it "does not replace the object already present", ->
					expect(database.cannotReplace.a).toEqual 23
					expect(database.cannotReplace.b).toEqual 8379
				it "does not update the object already present", ->
					expect(database.cannotReplace.c).toBeUndefined()
				it "generates a warning", ->
					expect(mockWarning).toHaveBeenCalledWith "The patch attempted to create the object cannotReplace, but it already existed in the database.  It has been skipped."
				describe "nested in updates", ->
					it "does not replace the object already present", ->
						expect(database.updatedByPatch.subCannotReplace.a).toEqual 23
						expect(database.updatedByPatch.subCannotReplace.b).toEqual 8379
					it "does not update the object already present", ->
						expect(database.updatedByPatch.subCannotReplace.c).toBeUndefined()
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
			describe "when the patch attempts to replace objects with", ->
				describe "integers", ->
					it "does not do so", ->
						expect(database.objectCannotReplaceWithInteger).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object objectCannotReplaceWithInteger with a value.  It has been skipped."
				describe "booleans (true)", ->
					it "does not do so", ->
						expect(database.objectCannotReplaceWithTrue).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object objectCannotReplaceWithTrue with a value.  It has been skipped."
				describe "booleans (false)", ->
					it "does not do so", ->
						expect(database.objectCannotReplaceWithFalse).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object objectCannotReplaceWithFalse with a value.  It has been skipped."
				describe "strings", ->
					it "does not do so", ->
						expect(database.objectCannotReplaceWithString).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object objectCannotReplaceWithString with a value.  It has been skipped."
				describe "arrays", ->
					it "does not do so", ->
						expect(database.objectCannotReplaceWithArray).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object objectCannotReplaceWithArray with a value.  It has been skipped."
			describe "when the patch attempts to replace nested objects with", ->
				describe "integers", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subObjectCannotReplaceWithInteger).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object objectCannotReplaceWithInteger with a value.  It has been skipped."
				describe "booleans (true)", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subObjectCannotReplaceWithTrue).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object updatedByPatch.subObjectCannotReplaceWithTrue with a value.  It has been skipped."
				describe "booleans (false)", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subObjectCannotReplaceWithFalse).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object updatedByPatch.subObjectCannotReplaceWithFalse with a value.  It has been skipped."
				describe "strings", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subObjectCannotReplaceWithString).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object objectCannotReplaceWithString with a value.  It has been skipped."
				describe "arrays", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subObjectCannotReplaceWithArray).toEqual
							a: 233987
							b: 2782
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the object updatedByPatch.subObjectCannotReplaceWithArray with a value.  It has been skipped."
			describe "when the patch attempts to replace", ->
				describe "integers with objects", ->
					it "does not do so", ->
						expect(database.integerCannotReplaceWithObject).toEqual 34793
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value integerCannotReplaceWithObject with an object.  It has been skipped."
				describe "booleans (true) with objects", ->
					it "does not do so", ->
						expect(database.trueCannotReplaceWithObject).toBe true
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value trueCannotReplaceWithObject with an object.  It has been skipped."
				describe "booleans (false) with objects", ->
					it "does not do so", ->
						expect(database.falseCannotReplaceWithObject).toBe false
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value falseCannotReplaceWithObject with an object.  It has been skipped."
				describe "strings with objects", ->
					it "does not do so", ->
						expect(database.stringCannotReplaceWithObject).toEqual "test unreplaced string"
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value stringCannotReplaceWithObject with an object.  It has been skipped."
				describe "arrays with objects", ->
					it "does not do so", ->
						expect(database.arrayCannotReplaceWithObject).toEqual [4784, 3492]
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value arrayCannotReplaceWithObject with an object.  It has been skipped."
			describe "when the patch attempts to replace nested", ->
				describe "integers with objects", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subIntegerCannotReplaceWithObject).toEqual 34793
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value updatedByPatch.subIntegerCannotReplaceWithObject with an object.  It has been skipped."
				describe "booleans (true) with objects", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subTrueCannotReplaceWithObject).toBe true
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value updatedByPatch.subTrueCannotReplaceWithObject with an object.  It has been skipped."
				describe "booleans (false) with objects", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subFalseCannotReplaceWithObject).toBe false
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value updatedByPatch.subFalseCannotReplaceWithObject with an object.  It has been skipped."
				describe "strings with objects", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subStringCannotReplaceWithObject).toEqual "test unreplaced string"
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value updatedByPatch.subStringCannotReplaceWithObject with an object.  It has been skipped."
				describe "arrays with objects", ->
					it "does not do so", ->
						expect(database.updatedByPatch.subArrayCannotReplaceWithObject).toEqual [4784, 3492]
					it "generates an error", ->
						expect(mockError).toHaveBeenCalledWith "The patch attempted to replace the value updatedByPatch.subArrayCannotReplaceWithObject with an object.  It has been skipped."
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
