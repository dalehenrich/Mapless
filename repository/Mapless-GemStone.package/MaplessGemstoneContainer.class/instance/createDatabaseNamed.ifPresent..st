other
createDatabaseNamed: aString ifPresent: aBlock

  self addDatabase: (MaplessGemstoneDatabase named: aString) ifPresent: aBlock