as yet unclassified
render: anObject equals: aString
  | x |
  self assert: (x := Json render: anObject) = aString