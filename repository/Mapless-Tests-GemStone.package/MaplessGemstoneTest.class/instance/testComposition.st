testing
testComposition

	| user guy |
	
	user := MaplessGemstoneDummyUser new
				userame: 'johnq';
				yourself.
	
	guy := MaplessGemstoneDummyPerson new
			firstName: 'john';
			lastName: 'q';
			yourself.

	user person: guy.
		
	self assert: user isUnsaved.
	self assert: guy isUnsaved.	
	self assert: ((user data at: 'person') class = MaplessGemstoneDummyPerson ).
	self assert: ((user data at: 'person') modelClass = #MaplessGemstoneDummyPerson).
	self assert: user oid isNil.
	self assert: (user data at: 'person') oid isNil.
	self assert: (user completeName = 'john q').
