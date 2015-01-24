testing
testSubModelsFromReifiedJSON

	| user guy jsonString reified |
	
	user := MaplessGemstoneDummyUser new
				userame: 'johnq';
				yourself.
	
	guy := MaplessGemstoneDummyPerson new
			firstName: 'john';
			lastName: 'q';
			yourself.

	user person: guy.
		
	jsonString := user unreferenced asJSONString.

	reified := MaplessGemstoneDummyUser fromJSONString: jsonString.

	self assert: guy isUnsaved.	
	self assert: reified person class = MaplessGemstoneDummyPerson.
	self assert: reified completeName = 'john q'.
