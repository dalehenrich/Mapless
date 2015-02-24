actions
save: aQuantity peopleOn: aStream 

	| firstNames lastNames delay savesPerSecond guys readsPerSecond |

	firstNames := OrderedCollection new.
	lastNames := OrderedCollection new.
	guys := OrderedCollection new.
	
	1 to: aQuantity do:[ :i |
		firstNames add: Character alphabet shuffled anyOne asString ].

	1 to: aQuantity do:[ :i |
		lastNames add: Character alphabet shuffled anyOne asString ].

	1 to: aQuantity do:[ :i |
		guys add: (MaplessGemstoneDummyPerson new
					firstName: (firstNames at: i);
					lastName: (lastNames at: i);	
					yourself)].	

	self databaseAt: 'flow' do:[ 
		delay := Time millisecondsToRun: [
			1 to: aQuantity do:[ :i | 
				 (guys at: i) save]]].
	
	savesPerSecond := ((1000 * aQuantity) / delay asFloat) truncated.
	
	aStream cr;
		nextPutAll: 'Saved ';
		nextPutAll: aQuantity asString;
		nextPutAll: ' instances of MaplessGemstoneDummyPerson in: ';
		nextPutAll: delay milliseconds asString;
		nextPutAll: ' ms ';
		nextPutAll: '(~',savesPerSecond asString,' saves per second)';
		flush.
		
	self databaseAt: 'flow' do:[ 
		delay := Time millisecondsToRun: [
				guys do:[ :guy | 
					MaplessGemstoneDummyUser findAt: guy oid]]].
	
	readsPerSecond := ((1000 * aQuantity) / delay asFloat) truncated.
	
	aStream cr;
		nextPutAll: 'Read ';
		nextPutAll: aQuantity asString;
		nextPutAll: ' instances of MaplessGemstoneDummyPerson in: ';
		nextPutAll: delay milliseconds asString;
		nextPutAll: ' ms ';
		nextPutAll: '(~',readsPerSecond asString,' reads per second)';
		flush.
