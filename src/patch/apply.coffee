warning = require "./../logs/warning"
error = require "./../logs/error"

recurse = (database, patch, stack) ->
	for key, fromPatch of patch
		if key isnt "created"
			fromDatabase = database[key]
			if (fromDatabase instanceof Object) and not (fromDatabase instanceof Array)
				if fromPatch is null
					database[key] = null
				else
					if (fromPatch instanceof Object) and not (fromPatch instanceof Array)
						if fromPatch.created
							warning "The patch attempted to create the object " + ((stack.concat key).join ".") + ", but it already existed in the database.  It has been skipped."
						else
							recurse fromDatabase, fromPatch, stack.concat key
					else
						error "The patch attempted to replace the object " + ((stack.concat key).join ".") + " with a value.  It has been skipped."
			else
				if (fromPatch instanceof Object) and not (fromPatch instanceof Array)
					if (fromDatabase isnt undefined) and (fromDatabase isnt null)
						error "The patch attempted to replace the value " + ((stack.concat key).join ".") + " with an object.  It has been skipped."
					else
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

module.exports = (database, patch) -> recurse database, patch, []
