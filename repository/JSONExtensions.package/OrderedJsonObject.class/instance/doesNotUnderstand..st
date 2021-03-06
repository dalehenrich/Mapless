actions
doesNotUnderstand: aMessage
	| key |
	key := aMessage selector.
	key isUnary ifTrue: [^ self at: key asString ifAbsent: [nil]].
	^ (key isKeyword and: [(key occurrencesOf: $:) = 1])
		ifTrue: [key := key allButLast asSymbol.
				self at: key put: aMessage arguments first]
		ifFalse: [super doesNotUnderstand: aMessage]