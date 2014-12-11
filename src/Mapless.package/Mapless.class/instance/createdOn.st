accessing
createdOn 

	| selector expects object|

	selector := 'createdOn'.
	expects := DateAndTime.

	object := self at: selector asString.
	object ifNil:[^nil].

	(object maplessIsKindOf: expects) ifTrue:[^object].

	^ self at: selector asString put: (self dateAndTimeAt: selector).
