private
addOrderedKeyIfAbsent: aString
	(dictionary includesKey: aString)
		ifFalse: [orderedKeys addLast: aString]