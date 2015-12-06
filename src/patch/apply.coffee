warning = require "./../logs/warning"

recurseCheck = (database, patch, stack) ->
	for key, fromPatch of patch
		if key isnt "created"
			fromDatabase = database[key]
			if fromPatch is null then continue
			if fromPatch is undefined then continue
			if fromDatabase is null then continue
			if fromDatabase is undefined then continue
			if (fromPatch instanceof Object) and (not (fromPatch instanceof Array)) and ((not (fromDatabase instanceof Object)) or (fromDatabase instanceof Array))
				throw new Error "The patch attempted to replace the value at " + ((stack.concat key).join ".") + " with an object"
			if (fromDatabase instanceof Object) and (not (fromDatabase instanceof Array)) and ((not (fromPatch instanceof Object)) or (fromPatch instanceof Array))
				throw new Error "The patch attempted to replace the object at " + ((stack.concat key).join ".") + " with a value"
			if (fromPatch instanceof Object) and not (fromPatch instanceof Array)
				recurseCheck fromDatabase, fromPatch, stack.concat key

recurse = (database, patch, stack) ->
	for key, fromPatch of patch
		if key isnt "created"
			fromDatabase = database[key]
			if (fromDatabase instanceof Object) and not (fromDatabase instanceof Array)
				if fromPatch is null
					database[key] = null
				else
					if fromPatch.created
						warning "The patch attempted to create the object " + ((stack.concat key).join ".") + ", but it already existed in the database.  It has been skipped."
					else
						recurse fromDatabase, fromPatch, stack.concat key
			else
				if (fromPatch instanceof Object) and not (fromPatch instanceof Array)
					if fromPatch.created
						database[key] = {}
						recurse database[key], fromPatch, stack.concat key
					else
						switch fromDatabase
							when null then warning "The patch attempted to update the object " + ((stack.concat key).join ".") + ", but it was deleted by a previous patch.  It has been skipped."
							when undefined then warning "The patch attempted to update the object " + ((stack.concat key).join ".") + ", but it does not exist.  It has been skipped."
				else
					if (fromPatch instanceof Array)
						database[key] = fromPatch.slice()
					else
						database[key] = fromPatch

module.exports = (database, patch) ->
	recurseCheck database, patch, []
	recurse database, patch, []
