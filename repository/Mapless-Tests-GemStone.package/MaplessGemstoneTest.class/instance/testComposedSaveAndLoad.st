testing
testComposedSaveAndLoad
  | user guy loaded |
  true
    ifTrue: [ 
      "not expeceted to run on GemStone: https://github.com/GsDevKit/Mapless/issues/11"
      ^ self ].
  user := MaplessGemstoneDummyUser new
    username: 'johnq';
    yourself.
  guy := MaplessGemstoneDummyPerson new
    firstName: 'john';
    lastName: 'q';
    yourself.
  user person: guy.	"Whithout saving a submodel"
  self assert: user isUnsaved.
  self assert: guy isUnsaved.
  self should: [ self do: [ user save ] ] raise: MaplessUnsavedSubmodel.	"After saving that submodel"
  self do: [ guy save ].
  self shouldnt: [ self do: [ user save ] ] raise: MaplessUnsavedSubmodel.
  self deny: user isUnsaved.
  self deny: guy isUnsaved.
  self
    do: [ 
      loaded := MaplessGemstoneDummyUser findAt: user oid.
      self assert: loaded notNil.
      self deny: loaded isUnsaved.
      self assert: loaded createdOn asUnixTime = user createdOn asUnixTime.
      self assert: loaded modifiedOn asUnixTime = user modifiedOn asUnixTime.
      loaded
        createdOn: nil;
        modifiedOn: nil.
      user
        createdOn: nil;
        modifiedOn: nil.
      loaded data
        keysAndValuesDo: [ :k :v | self assert: v = (user data at: k) ].
      self assert: loaded username = 'johnq'.
      self assert: loaded person firstName = 'john'.
      self assert: loaded person lastName = 'q'.
      self
        assert: loaded person modelClass = MaplessGemstoneDummyPerson asString.
      self assert: loaded person model class = MaplessGemstoneDummyPerson ]