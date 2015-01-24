private
removeOrderedKeyIfPresent: aKey
	(self includesKey: aKey)
		ifTrue: [orderedKeys remove: aKey]