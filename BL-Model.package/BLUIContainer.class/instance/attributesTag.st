accessing
attributesTag
	^ self attributes asOrderedCollection flatCollect: [ :attribute | attribute asString , ' ' ]