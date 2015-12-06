recurseCreate = (obj) ->
	output = 
		created: true
	for key, value of obj
		if value instanceof Array
			output[key] = JSON.parse JSON.stringify value
		else
			if value instanceof Object
				output[key] = recurseCreate value
			else
				if value isnt null
					output[key] = value
	output

recurse = (a, b, stack) ->
	output = {}

	allKeys = Object.keys a
	allKeys.push key for key in Object.keys b when (allKeys.indexOf key) is -1
	
	for key in allKeys
		fromA = a[key]
		fromB = b[key]

		if fromA isnt null and fromA isnt undefined and ((fromA instanceof Array) or not (fromA instanceof Object)) and (fromB instanceof Object) and not (fromB instanceof Array)
			throw new Error "A patch cannot be generated as it would require replacing the value at " + ((stack.concat key).join ".") + " with an object"

		if fromB isnt null and fromB isnt undefined and ((fromB instanceof Array) or not (fromB instanceof Object)) and (fromA instanceof Object) and not (fromA instanceof Array)
			throw new Error "A patch cannot be generated as it would require replacing the object at " + ((stack.concat key).join ".") + " with a value"

		if fromB is undefined and fromA isnt null
			output[key] = null
		else
			if fromB instanceof Array
				jsonB = JSON.stringify fromB
				if jsonB is JSON.stringify fromA then continue
				output[key] = JSON.parse jsonB
			else
				if fromB instanceof Object
					if not (fromA instanceof Object)
						output[key] = recurseCreate fromB
					else
						temp = recurse fromA, fromB, stack.concat key
						if temp is null then continue
						output[key] = temp
				else
					if fromA is fromB then continue
					if (fromA is null) and (fromB is undefined) then continue
					if (fromA is undefined) and (fromB is null) then continue
					output[key] = fromB

	if (Object.keys output).length
		output
	else
		null

module.exports = (a, b) -> recurse a, b, []
