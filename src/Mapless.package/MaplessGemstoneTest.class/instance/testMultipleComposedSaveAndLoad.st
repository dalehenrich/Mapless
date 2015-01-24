testing
testMultipleComposedSaveAndLoad

	| user guy tags loaded |
	
	user := MaplessGemstoneDummyUser new
				username: 'johnq';
				yourself.
	
	guy := MaplessGemstoneDummyPerson new
			firstName: 'john';
			lastName: 'q';
			yourself.

	tags := OrderedCollection new.
	tags 
		add: (MaplessGemstoneDummyTag new label: 'cool'; yourself);	
		add: (MaplessGemstoneDummyTag new label: 'stuff'; yourself);	
		yourself.
		
	user 
		person: guy;
		tags: tags;
		yourself.
		
	self do:[ tags do:[ :tag | tag save] ].
	self do:[ guy save ].
	self shouldnt: [ self do:[ user save ] ] raise: MaplessUnsavedSubmodel.
	
	self deny: user isUnsaved.	
	self deny: guy isUnsaved.	
	self assert: (tags allSatisfy: [:e| e isUnsaved not]).

	self do:[ loaded := MaplessGemstoneDummyUser findAt: user oid.
		self assert: loaded notNil.
		self deny: loaded isUnsaved.
		self assert: loaded username = 'johnq'.
		self assert: loaded tags isCollection.
		self assert: loaded tags notEmpty.
		self assert: loaded tags isCollection.
		loaded tags do:[:tag|
			self assert: (tags anySatisfy:[:t| t id = tag id])].
		]
