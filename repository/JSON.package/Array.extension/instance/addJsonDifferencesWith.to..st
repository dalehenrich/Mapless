*json
addJsonDifferencesWith: anArray to: anOrderedCollection
	self = anArray
		ifFalse: [ 
			self size = anArray size
				ifTrue: [ 
					self
						do: [ :each | 
							(anArray includes: each)
								ifFalse: [ anArray do: [ :eachItem | each addJsonDifferencesWith: eachItem to: anOrderedCollection ] ] ] ]
				ifFalse: [ anOrderedCollection add: 'these json arrays are of different size ' , self greaseString , ' & ' , anArray greaseString ] ]