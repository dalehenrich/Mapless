testing
testComposedAccess
	"Test proxies and its on-demand-load and DNU mechanism"

	| user guy |
	
	user := MaplessGemstoneDummyUser new
				userame: 'johnq';
				yourself.
	
	guy := MaplessGemstoneDummyPerson new
			firstName: 'john';
			lastName: 'q';
			yourself.

	user person: guy. 

	self do:[ 
		guy save. 
		user save ].
	
	self do:[
		self assert: ( MaplessGemstoneDummyUser findAt: user oid ) completeName = 'john q'.
		self assert: ( MaplessGemstoneDummyUser findAt: user oid ) person class = MaplessReference.
		self assert: ( MaplessGemstoneDummyUser findAt: user oid ) person model class = MaplessGemstoneDummyPerson.
		self assert: ( MaplessGemstoneDummyUser findAt: user oid ) person firstName = 'john'.
		self assert: ( MaplessGemstoneDummyUser findAt: user oid ) person lastName = 'q' ]
