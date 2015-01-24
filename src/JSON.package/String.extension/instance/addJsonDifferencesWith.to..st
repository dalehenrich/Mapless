*JSON
addJsonDifferencesWith: anObject to: anOrderedCollection
	self = anObject
		ifFalse: [ 
			anObject isString
				ifTrue: [ 
					| locations |
					locations := OrderedCollection new.
					self
						doWithIndex: [ :each :index | 
						anObject size >= index ifTrue:[	(anObject at: index) = each
								ifFalse: [ locations add: index ] ]].
					anOrderedCollection
						add: 'string difference GOT ' , self , ' BUT EXPECTED ' , anObject , ' ' , locations asCommaString ]
				ifFalse: [ anOrderedCollection add: 'expected a String but got a ' , anObject className ] ]