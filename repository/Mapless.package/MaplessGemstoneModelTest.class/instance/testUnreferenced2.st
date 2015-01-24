testing
testUnreferenced2

	| friends guy stuff loaded reified | 
	
	friends := OrderedCollection new
				add: (MaplessGemstoneDummyPerson new
						firstName: 'Frodo';
						yourself);
				add: (MaplessGemstoneDummyPerson new
						firstName: 'Gandalf';
						yourself);
				add: (MaplessGemstoneDummyPerson new
						firstName: 'Boromir';
						yourself);
				yourself.
				
	stuff := #('Ice cream' 'waffles' 'french fries') asOrderedCollection.
	
	guy := MaplessGemstoneDummyPerson new
				firstName: 'dude';
				favorites: stuff;
				friends: friends;
				yourself.
	
	friends do: [:e | self do:[ e save]].
	self do:[guy save].
	self deny: guy isUnsaved.
	
	self do:[ loaded := MaplessGemstoneDummyPerson findAt: guy oid].
	
	self assert: loaded notNil.
	self deny: loaded isUnsaved.
	
	self do: [ reified := loaded unreferenced ].

	self assert: reified data friends class = OrderedCollection.
	self assert: reified data favorites = stuff.
