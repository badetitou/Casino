accessing
attributesTag
	^ self attributes flatCollect: [ :attribute | attribute asString , ' ' ]