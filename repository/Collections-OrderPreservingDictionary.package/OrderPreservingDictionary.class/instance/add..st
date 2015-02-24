adding
add: anAssociation
	self addOrderedKeyIfAbsent: anAssociation key.
	^ dictionary add: anAssociation.