testing
isVerifiedUsing: aContext
	^ aContext select: [ :a | a isClass and: [ a name = attributName ] ]