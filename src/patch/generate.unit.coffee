describe "generate", ->
	rewire = require "rewire"
	generate = undefined
	beforeEach ->
		generate = rewire "./generate"
	describe "on calling", ->
		a = b = patch = undefined

		describe "when the inputs are the same", ->
			beforeEach ->
				a = 
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

				b = 
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

				patch = generate a, b

			it "does not modify the first database", ->
				expect(a).toEqual
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

			it "does not modify the second database", ->
				expect(b).toEqual
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

			it "returns null", ->
				expect(patch).toBeNull()

		describe "when the inputs would replace", ->
			describe "an integer with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: 2379
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: 2379
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at invalid with an object"

			describe "true with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: true
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: true
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at invalid with an object"

			describe "false with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: false
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: false
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at invalid with an object"

			describe "a string with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: "invalid string"
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: "invalid string"
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at invalid with an object"

			describe "an array with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: [23, 34636, 135235]
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid: [23, 34636, 135235]
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						invalid:
							a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at invalid with an object"

			describe "a nested integer with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: 2379
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: 2379
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at updatedObject.invalid with an object"

			describe "nested true with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: true
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: true
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at updatedObject.invalid with an object"

			describe "nested false with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: false
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: false
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at updatedObject.invalid with an object"

			describe "a nested string with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: "invalid string"
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: "invalid string"
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at updatedObject.invalid with an object"

			describe "a nested array with an object", ->
				beforeEach ->
					a = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: [23, 34636, 135235]
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

					b = 
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the first database", ->
					try
						generate a, b

					expect(a).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid: [23, 34636, 135235]
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "does not modify the second database", ->
					try
						generate a, b

					expect(b).toEqual
						rootUnchangedInteger: 39283
						rootUnchangedTrue: true
						rootUnchangedFalse: false
						rootUnchangedString: "test unchanged string"
						rootUnchangedArray: [439, 234767, 237]
						rootUnchangedNull: null
						updatedObject:
							invalid:
								a: 847923
						unchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
							nestedDeletedNull: null

				it "throws an error", ->
					expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the value at updatedObject.invalid with an object"

			describe "an object with", ->
				describe "an integer", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: 2379
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: 2379
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at invalid with a value"

				describe "true", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: true
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: true
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at invalid with a value"

				describe "false", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: false
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: false
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at invalid with a value"

				describe "a string", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: "invalid string"
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: "invalid string"
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at invalid with a value"

				describe "an array", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: [23, 34636, 135235]
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid:
								a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							invalid: [23, 34636, 135235]
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at invalid with a value"

			describe "a nested object with", ->
				describe "an integer", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: 2379
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: 2379
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at updatedObject.invalid with a value"

				describe "true", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: true
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: true
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at updatedObject.invalid with a value"

				describe "false", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: false
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: false
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at updatedObject.invalid with a value"

				describe "a string", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: "invalid string"
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: "invalid string"
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at updatedObject.invalid with a value"

				describe "an array", ->
					beforeEach ->
						a = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

						b = 
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: [23, 34636, 135235]
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the first database", ->
						try
							generate a, b

						expect(a).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid:
									a: 847923
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "does not modify the second database", ->
						try
							generate a, b

						expect(b).toEqual
							rootUnchangedInteger: 39283
							rootUnchangedTrue: true
							rootUnchangedFalse: false
							rootUnchangedString: "test unchanged string"
							rootUnchangedArray: [439, 234767, 237]
							rootUnchangedNull: null
							updatedObject:
								invalid: [23, 34636, 135235]
							unchangedObject:
								nestedUnchangedInteger: 39283
								nestedUnchangedTrue: true
								nestedUnchangedFalse: false
								nestedUnchangedString: "test unchanged string"
								nestedUnchangedArray: [439, 234767, 237]
								nestedUnchangedNull: null
								nestedDeletedNull: null

					it "throws an error", ->
						expect(-> generate a, b).toThrowError "A patch cannot be generated as it would require replacing the object at updatedObject.invalid with a value"

		describe "when the inputs are valid and distinct", ->
			beforeEach ->
				a = 
					rootUnchangedInteger: 39283
					rootUnchangedTrue: true
					rootUnchangedFalse: false
					rootUnchangedString: "test unchanged string"
					rootUnchangedArray: [439, 234767, 237]
					rootUnchangedNull: null
					rootChangedInteger: 32923
					rootChangedTrue: true
					rootChangedFalse: false
					rootChangedString: "test pre-change string"
					rootChangedArrayShorter: [23, 8478, 64]
					rootChangedArrayLonger: [2389, 4876, 3]
					rootChangedArrayValues: [434, 38, 346]
					nullToInteger: null
					nullToTrue: null
					nullToFalse: null
					nullToString: null
					nullToArray: null
					nullToEmpty: null
					rootDeletedNull: null
					updatedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
						nestedUnchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
						nestedChangedInteger: 32923
						nestedChangedTrue: true
						nestedChangedFalse: false
						nestedChangedString: "test pre-change string"
						nestedChangedArrayShorter: [23, 8478, 64]
						nestedChangedArrayLonger: [2389, 4876, 3]
						nestedChangedArrayValues: [434, 38, 346]
						nestedNullToInteger: null
						nestedNullToTrue: null
						nestedNullToFalse: null
						nestedNullToString: null
						nestedNullToArray: null
						nestedNullToEmpty: null
						nestedDeletedNull: null
						nestedIntegerDeletedByOmission: 32397
						nestedTrueDeletedByOmission: true
						nestedFalseDeletedByOmission: false
						nestedStringDeletedByOmission: "test deleted string"
						nestedArrayDeletedByOmission: [334, 45346, 226246]
						nestedObjectDeletedByOmission:
							a: 8237928347
						nestedIntegerDeletedByNull: 32397
						nestedTrueDeletedByNull: true
						nestedFalseDeletedByNull: false
						nestedStringDeletedByNull: "test deleted string"
						nestedArrayDeletedByNull: [334, 45346, 226246]
						nestedObjectDeletedByNull:
							a: 8237928347
					unchangedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
						nestedDeletedNull: null
					rootIntegerDeletedByOmission: 32397
					rootTrueDeletedByOmission: true
					rootFalseDeletedByOmission: false
					rootStringDeletedByOmission: "test deleted string"
					rootArrayDeletedByOmission: [334, 45346, 226246]
					rootObjectDeletedByOmission:
						a: 8237928347
					rootIntegerDeletedByNull: 32397
					rootTrueDeletedByNull: true
					rootFalseDeletedByNull: false
					rootStringDeletedByNull: "test deleted string"
					rootArrayDeletedByNull: [334, 45346, 226246]
					rootObjectDeletedByNull:
						a: 8237928347

				b = 
					rootUnchangedInteger: 39283
					rootUnchangedTrue: true
					rootUnchangedFalse: false
					rootUnchangedString: "test unchanged string"
					rootUnchangedArray: [439, 234767, 237]
					rootUnchangedNull: null
					rootChangedInteger: 864864
					rootChangedTrue: false
					rootChangedFalse: true
					rootChangedString: "test post-change string"
					rootChangedArrayShorter: [23, 8478]
					rootChangedArrayLonger: [2389, 4876, 3, 647]
					rootChangedArrayValues: [434, 987, 346]
					updatedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
						nestedUnchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
						nestedChangedInteger: 864864
						nestedChangedTrue: false
						nestedChangedFalse: true
						nestedChangedString: "test post-change string"
						nestedChangedArrayShorter: [23, 8478]
						nestedChangedArrayLonger: [2389, 4876, 3, 647]
						nestedChangedArrayValues: [434, 987, 346]
						nestedNewInteger: 23793
						nestedNewTrue: true
						nestedNewFalse: false
						nestedNewString: "test new string"
						nestedNewArray: [237, 42349, 425, 353]
						nestedNewNull: null
						nestedNewEmpty: {}
						nestedNullToInteger: 23793
						nestedNullToTrue: true
						nestedNullToFalse: false
						nestedNullToString: "test new string"
						nestedNullToArray: [237, 42349, 425, 353]
						nestedNullToEmpty: {}
						nestedIntegerDeletedByNull: null
						nestedTrueDeletedByNull: null
						nestedFalseDeletedByNull: null
						nestedStringDeletedByNull: null
						nestedArrayDeletedByNull: null
						nestedObjectDeletedByNull: null
					unchangedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
					createdObject:
						nestedNewInteger: 23793
						nestedNewTrue: true
						nestedNewFalse: false
						nestedNewString: "test new string"
						nestedNewArray: [237, 42349, 425, 353]
						nestedNewNull: null
						nestedNewEmpty: {}
					newInteger: 23793
					newTrue: true
					newFalse: false
					newString: "test new string"
					newArray: [237, 42349, 425, 353]
					newNull: null
					newEmpty: {}
					nullToInteger: 23793
					nullToTrue: true
					nullToFalse: false
					nullToString: "test new string"
					nullToArray: [237, 42349, 425, 353]
					nullToEmpty: {}
					rootIntegerDeletedByNull: null
					rootTrueDeletedByNull: null
					rootFalseDeletedByNull: null
					rootStringDeletedByNull: null
					rootArrayDeletedByNull: null
					rootObjectDeletedByNull: null

				patch = generate a, b

			it "does not modify the first database", ->
				expect(a).toEqual
					rootUnchangedInteger: 39283
					rootUnchangedTrue: true
					rootUnchangedFalse: false
					rootUnchangedString: "test unchanged string"
					rootUnchangedArray: [439, 234767, 237]
					rootUnchangedNull: null
					rootChangedInteger: 32923
					rootChangedTrue: true
					rootChangedFalse: false
					rootChangedString: "test pre-change string"
					rootChangedArrayShorter: [23, 8478, 64]
					rootChangedArrayLonger: [2389, 4876, 3]
					rootChangedArrayValues: [434, 38, 346]
					nullToInteger: null
					nullToTrue: null
					nullToFalse: null
					nullToString: null
					nullToArray: null
					nullToEmpty: null
					rootDeletedNull: null
					updatedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
						nestedUnchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
						nestedChangedInteger: 32923
						nestedChangedTrue: true
						nestedChangedFalse: false
						nestedChangedString: "test pre-change string"
						nestedChangedArrayShorter: [23, 8478, 64]
						nestedChangedArrayLonger: [2389, 4876, 3]
						nestedChangedArrayValues: [434, 38, 346]
						nestedNullToInteger: null
						nestedNullToTrue: null
						nestedNullToFalse: null
						nestedNullToString: null
						nestedNullToArray: null
						nestedNullToEmpty: null
						nestedDeletedNull: null
						nestedIntegerDeletedByOmission: 32397
						nestedTrueDeletedByOmission: true
						nestedFalseDeletedByOmission: false
						nestedStringDeletedByOmission: "test deleted string"
						nestedArrayDeletedByOmission: [334, 45346, 226246]
						nestedObjectDeletedByOmission:
							a: 8237928347
						nestedIntegerDeletedByNull: 32397
						nestedTrueDeletedByNull: true
						nestedFalseDeletedByNull: false
						nestedStringDeletedByNull: "test deleted string"
						nestedArrayDeletedByNull: [334, 45346, 226246]
						nestedObjectDeletedByNull:
							a: 8237928347
					unchangedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
						nestedDeletedNull: null
					rootIntegerDeletedByOmission: 32397
					rootTrueDeletedByOmission: true
					rootFalseDeletedByOmission: false
					rootStringDeletedByOmission: "test deleted string"
					rootArrayDeletedByOmission: [334, 45346, 226246]
					rootObjectDeletedByOmission:
						a: 8237928347
					rootIntegerDeletedByNull: 32397
					rootTrueDeletedByNull: true
					rootFalseDeletedByNull: false
					rootStringDeletedByNull: "test deleted string"
					rootArrayDeletedByNull: [334, 45346, 226246]
					rootObjectDeletedByNull:
						a: 8237928347

			it "does not modify the second database", ->
				expect(b).toEqual
					rootUnchangedInteger: 39283
					rootUnchangedTrue: true
					rootUnchangedFalse: false
					rootUnchangedString: "test unchanged string"
					rootUnchangedArray: [439, 234767, 237]
					rootUnchangedNull: null
					rootChangedInteger: 864864
					rootChangedTrue: false
					rootChangedFalse: true
					rootChangedString: "test post-change string"
					rootChangedArrayShorter: [23, 8478]
					rootChangedArrayLonger: [2389, 4876, 3, 647]
					rootChangedArrayValues: [434, 987, 346]
					updatedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
						nestedUnchangedObject:
							nestedUnchangedInteger: 39283
							nestedUnchangedTrue: true
							nestedUnchangedFalse: false
							nestedUnchangedString: "test unchanged string"
							nestedUnchangedArray: [439, 234767, 237]
							nestedUnchangedNull: null
						nestedChangedInteger: 864864
						nestedChangedTrue: false
						nestedChangedFalse: true
						nestedChangedString: "test post-change string"
						nestedChangedArrayShorter: [23, 8478]
						nestedChangedArrayLonger: [2389, 4876, 3, 647]
						nestedChangedArrayValues: [434, 987, 346]
						nestedNewInteger: 23793
						nestedNewTrue: true
						nestedNewFalse: false
						nestedNewString: "test new string"
						nestedNewArray: [237, 42349, 425, 353]
						nestedNewNull: null
						nestedNewEmpty: {}
						nestedNullToInteger: 23793
						nestedNullToTrue: true
						nestedNullToFalse: false
						nestedNullToString: "test new string"
						nestedNullToArray: [237, 42349, 425, 353]
						nestedNullToEmpty: {}
						nestedIntegerDeletedByNull: null
						nestedTrueDeletedByNull: null
						nestedFalseDeletedByNull: null
						nestedStringDeletedByNull: null
						nestedArrayDeletedByNull: null
						nestedObjectDeletedByNull: null
					unchangedObject:
						nestedUnchangedInteger: 39283
						nestedUnchangedTrue: true
						nestedUnchangedFalse: false
						nestedUnchangedString: "test unchanged string"
						nestedUnchangedArray: [439, 234767, 237]
						nestedUnchangedNull: null
					createdObject:
						nestedNewInteger: 23793
						nestedNewTrue: true
						nestedNewFalse: false
						nestedNewString: "test new string"
						nestedNewArray: [237, 42349, 425, 353]
						nestedNewNull: null
						nestedNewEmpty: {}
					newInteger: 23793
					newTrue: true
					newFalse: false
					newString: "test new string"
					newArray: [237, 42349, 425, 353]
					newNull: null
					newEmpty: {}
					nullToInteger: 23793
					nullToTrue: true
					nullToFalse: false
					nullToString: "test new string"
					nullToArray: [237, 42349, 425, 353]
					nullToEmpty: {}
					rootIntegerDeletedByNull: null
					rootTrueDeletedByNull: null
					rootFalseDeletedByNull: null
					rootStringDeletedByNull: null
					rootArrayDeletedByNull: null
					rootObjectDeletedByNull: null

			it "includes empty created objects", -> 
				expect(patch.newEmpty).toEqual
					created: true
				expect(patch.nullToEmpty).toEqual
					created: true
			it "includes empty created objects nested in updates", -> 
				expect(patch.updatedObject.nestedNewEmpty).toEqual
					created: true
				expect(patch.updatedObject.nestedNullToEmpty).toEqual
					created: true
			it "includes empty created objects nested in creates", -> expect(patch.createdObject.nestedNewEmpty).toEqual
				created: true
			describe "it includes properties which have changed value", ->
				it "integer", -> expect(patch.rootChangedInteger).toEqual 864864
				it "true", -> expect(patch.rootChangedTrue).toBe false
				it "false", -> expect(patch.rootChangedTrue).toBe false
				it "string", -> expect(patch.rootChangedString).toEqual "test post-change string"
				it "array (shortened)", -> 
					expect(patch.rootChangedArrayShorter).toEqual [23, 8478]
					expect(patch.rootChangedArrayShorter).not.toBe b.nestedChangedArrayShorter
				it "array (lengthened)", -> 
					expect(patch.rootChangedArrayLonger).toEqual [2389, 4876, 3, 647]
					expect(patch.rootChangedArrayLonger).not.toBe b.nestedChangedArrayLonger
				it "array (items changed)", -> 
					expect(patch.rootChangedArrayValues).toEqual [434, 987, 346]
					expect(patch.rootChangedArrayValues).not.toBe b.nestedChangedArrayValues
				describe "in updated objects", ->
					it "integer", -> expect(patch.updatedObject.nestedChangedInteger).toEqual 864864
					it "true", -> expect(patch.updatedObject.nestedChangedTrue).toBe false
					it "false", -> expect(patch.updatedObject.nestedChangedTrue).toBe false
					it "string", -> expect(patch.updatedObject.nestedChangedString).toEqual "test post-change string"
					it "array (shortened)", -> 
						expect(patch.updatedObject.nestedChangedArrayShorter).toEqual [23, 8478]
						expect(patch.updatedObject.nestedChangedArrayShorter).not.toBe b.updatedObject.nestedChangedArrayShorter
					it "array (lengthened)", -> 
						expect(patch.updatedObject.nestedChangedArrayLonger).toEqual [2389, 4876, 3, 647]
						expect(patch.updatedObject.nestedChangedArrayLonger).not.toBe b.updatedObject.nestedChangedArrayLonger
					it "array (items changed)", -> 
						expect(patch.updatedObject.nestedChangedArrayValues).toEqual [434, 987, 346]
						expect(patch.updatedObject.nestedChangedArrayValues).not.toBe b.updatedObject.nestedChangedArrayValues
			describe "it includes properties which are now null", ->
				it "integer", -> expect(patch.rootIntegerDeletedByNull).toBeNull()
				it "true", -> expect(patch.rootTrueDeletedByNull).toBeNull()
				it "false", -> expect(patch.rootFalseDeletedByNull).toBeNull()
				it "string", -> expect(patch.rootStringDeletedByNull).toBeNull()
				it "array", -> expect(patch.rootArrayDeletedByNull).toBeNull()
				it "objects", -> expect(patch.rootObjectDeletedByNull).toBeNull()
				describe "in updated objects", ->
					it "integer", -> expect(patch.updatedObject.nestedIntegerDeletedByNull).toBeNull()
					it "true", -> expect(patch.updatedObject.nestedTrueDeletedByNull).toBeNull()
					it "false", -> expect(patch.updatedObject.nestedFalseDeletedByNull).toBeNull()
					it "string", -> expect(patch.updatedObject.nestedStringDeletedByNull).toBeNull()
					it "array", -> expect(patch.updatedObject.nestedArrayDeletedByNull).toBeNull()
					it "objects", -> expect(patch.updatedObject.nestedObjectDeletedByNull).toBeNull()

			describe "it includes properties which are no longer present as null", ->
				it "integer", -> expect(patch.rootIntegerDeletedByOmission).toBeNull()
				it "true", -> expect(patch.rootTrueDeletedByOmission).toBeNull()
				it "false", -> expect(patch.rootFalseDeletedByOmission).toBeNull()
				it "string", -> expect(patch.rootStringDeletedByOmission).toBeNull()
				it "array", -> expect(patch.rootArrayDeletedByOmission).toBeNull()
				it "objects", -> expect(patch.rootObjectDeletedByOmission).toBeNull()
				describe "in updated objects", ->
					it "integer", -> expect(patch.updatedObject.nestedIntegerDeletedByOmission).toBeNull()
					it "true", -> expect(patch.updatedObject.nestedTrueDeletedByOmission).toBeNull()
					it "false", -> expect(patch.updatedObject.nestedFalseDeletedByOmission).toBeNull()
					it "string", -> expect(patch.updatedObject.nestedStringDeletedByOmission).toBeNull()
					it "array", -> expect(patch.updatedObject.nestedArrayDeletedByOmission).toBeNull()
					it "objects", -> expect(patch.updatedObject.nestedObjectDeletedByOmission).toBeNull()

			describe "it includes properties which were not present", ->
				it "integer", -> expect(patch.newInteger).toEqual 23793
				it "true", -> expect(patch.newTrue).toBe true
				it "false", -> expect(patch.newFalse).toBe false
				it "string", -> expect(patch.newString).toEqual "test new string"
				it "array", ->
					expect(patch.newArray).toEqual [237, 42349, 425, 353]
					expect(patch.newArray).not.toBe b.newArray
				describe "in updated objects", ->
					it "integer", -> expect(patch.updatedObject.nestedNewInteger).toEqual 23793
					it "true", -> expect(patch.updatedObject.nestedNewTrue).toBe true
					it "false", -> expect(patch.updatedObject.nestedNewFalse).toBe false
					it "string", -> expect(patch.updatedObject.nestedNewString).toEqual "test new string"
					it "array", ->
						expect(patch.updatedObject.nestedNewArray).toEqual [237, 42349, 425, 353]
						expect(patch.updatedObject.nestedNewArray).not.toBe b.updatedObject.nestedNewArray
				describe "in created objects", ->
					it "integer", -> expect(patch.createdObject.nestedNewInteger).toEqual 23793
					it "true", -> expect(patch.createdObject.nestedNewTrue).toBe true
					it "false", -> expect(patch.createdObject.nestedNewFalse).toBe false
					it "string", -> expect(patch.createdObject.nestedNewString).toEqual "test new string"
					it "array", ->
						expect(patch.createdObject.nestedNewArray).toEqual [237, 42349, 425, 353]
						expect(patch.createdObject.nestedNewArray).not.toBe b.createdObject.nestedNewArray
			describe "it includes properties which were null", ->
				it "integer", -> expect(patch.nullToInteger).toEqual 23793
				it "true", -> expect(patch.nullToTrue).toBe true
				it "false", -> expect(patch.nullToFalse).toBe false
				it "string", -> expect(patch.nullToString).toEqual "test new string"
				it "array", ->
					expect(patch.nullToArray).toEqual [237, 42349, 425, 353]
					expect(patch.nullToArray).not.toBe b.nullToArray
				describe "in updated objects", ->
					it "integer", -> expect(patch.updatedObject.nestedNullToInteger).toEqual 23793
					it "true", -> expect(patch.updatedObject.nestedNullToTrue).toBe true
					it "false", -> expect(patch.updatedObject.nestedNullToFalse).toBe false
					it "string", -> expect(patch.updatedObject.nestedNullToString).toEqual "test new string"
					it "array", ->
						expect(patch.updatedObject.nestedNewArray).toEqual [237, 42349, 425, 353]
						expect(patch.updatedObject.nestedNewArray).not.toBe b.updatedObject.nestedNullToArray
			it "does not reference the database's objects", -> expect(patch.createdObject).not.toBe b.createdObject
			describe "it does not include new nulls which were not present", ->
				it "in the root", -> expect(patch.newNull).toBeUndefined()
				it "in updated objects", -> expect(patch.updatedObject.nestedNewNull).toBeUndefined()
				it "in created objects", -> expect(patch.createdObject.nestedNewNull).toBeUndefined()
			describe "it does not include nonpresent properties which were null", ->
				it "in the root", -> expect(patch.rootDeletedNull).toBeUndefined()
				it "in updated objects", -> expect(patch.updatedObject.nestedDeletedNull).toBeUndefined()
			it "includes the \"created\" flag on objects only present in the new database", ->
				expect(patch.createdObject.created).toBe true
			it "does not include the \"created\" flag on objects present in the old database", ->
				expect(patch.updatedObject.created).toBeUndefined()
			describe "it does not include properties which are the same value", ->
				it "integer", -> expect(patch.unchangedInteger).toBeUndefined()
				it "true", -> expect(patch.unchangedTrue).toBeUndefined()
				it "false", -> expect(patch.unchangedFalse).toBeUndefined()
				it "string", -> expect(patch.unchangedString).toBeUndefined()
				it "array", -> expect(patch.unchangedArray).toBeUndefined()
				it "null", -> expect(patch.unchangedNull).toBeUndefined()
				it "object", -> expect(patch.unchangedObject).toBeUndefined()
				describe "in nested objects", ->
					it "integer", -> expect(patch.updatedObject.nestedUnchangedInteger).toBeUndefined()
					it "true", -> expect(patch.updatedObject.nestedUnchangedTrue).toBeUndefined()
					it "false", -> expect(patch.updatedObject.nestedUnchangedFalse).toBeUndefined()
					it "string", -> expect(patch.updatedObject.nestedUnchangedString).toBeUndefined()
					it "array", -> expect(patch.updatedObject.nestedUnchangedArray).toBeUndefined()
					it "null", -> expect(patch.updatedObject.nestedUnchangedNull).toBeUndefined()
					it "object", -> expect(patch.updatedObject.nestedUnchangedObject).toBeUndefined()
