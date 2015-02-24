testing
testComposedSave
  | user guy |
  true
    ifTrue: [ 
      "not expeceted to run on GemStone: https://github.com/GsDevKit/Mapless/issues/11"
      ^ self ].
  user := MaplessGemstoneDummyUser new
    userame: 'johnq';
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
  self deny: guy isUnsaved