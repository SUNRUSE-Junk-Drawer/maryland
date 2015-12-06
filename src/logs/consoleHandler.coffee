module.exports = (severity, message) -> switch severity
	when "verbose" then console.log message
	when "information" then console.info message
	when "warning" then console.warning message
	when "error" then console.error message
