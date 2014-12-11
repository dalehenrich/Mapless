testing
isReifiedJSON: anObject 
	^ (anObject maplessIsKindOf: JsonObject) or:[
	anObject maplessIsKindOf: OrderedJsonObject ]
