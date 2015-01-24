comparing
= anAbstractDictionary

"Returns true if all of the following conditions are true:

 1.  The receiver and anAbstractDictionary are of the same class.
 2.  The two dictionaries are of the same size.
 3.  The corresponding keys and values of the receiver and anAbstractDictionary
     are equal."

(self == anAbstractDictionary)
  ifTrue: [ ^ true ].

(self _class == anAbstractDictionary _class)
  ifFalse: [ ^ false ].

(self size = anAbstractDictionary size)
  ifFalse: [ ^ false ].

self keysAndValuesDo: [ :aKey :aValue |
  (aValue = (anAbstractDictionary at: aKey ifAbsent: [nil]))
    ifFalse: [ ^ false ]
  ].

^ true.
