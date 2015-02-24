actions
jsonWriteOn: aStream
	
	| lastOne |

	lastOne := self associations last.
	
	aStream nextPut: ${.
	
	self associationsDo: [:each |
		each jsonWriteOn: aStream.
		each ~= lastOne ifTrue: [ aStream nextPut: $, ]].

	aStream nextPut: $}