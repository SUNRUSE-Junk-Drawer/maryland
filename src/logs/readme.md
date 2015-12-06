A central log message sink where messages can be routed to the real console, in-game console, files, etc.

# Modules

## verbose

Passes the given message to every handler in the sink with a severity of "verbose".

## information

Passes the given message to every handler in the sink with a severity of "information".

## warning

Passes the given message to every handler in the sink with a severity of "warning".

## error

Passes the given message to every handler in the sink with a severity of "error".

## sink

An array of functions which will be called when an event is logged.
These should take:

- A string specifying severity, of "verbose", "information", "warning", "error".
- A string specifying the message.  There are no restrictions on what this can contain.

By default this contains the "console" module.

## console

A log event handler which writes events to the browser/CLI console.
