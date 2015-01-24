accessing
at: aKey put: aBlock
	self addOrderedKeyIfAbsent: aKey.
	^ dictionary at: aKey put: aBlock.