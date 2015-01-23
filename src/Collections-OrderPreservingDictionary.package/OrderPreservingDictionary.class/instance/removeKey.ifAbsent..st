removing
removeKey: aKey ifAbsent: aBlock
	self removeOrderedKeyIfPresent: aKey.
	^ dictionary removeKey: aKey ifAbsent: aBlock.