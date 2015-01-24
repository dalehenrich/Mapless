accessing
findUsername: anUsername

	^  self databaseCollection detect: [ :each | 
		( each username = anUsername) ] 
