*BL-Model-Exporter-Angular
uniqueName
	| shortName |
	shortName := self isAnonymousClass
		ifTrue: [ self name
				copyFrom: (self name findString: '(') + 1
				to: (self name findLastOccurrenceOfString: ')' startingAt: 0) - 1 ]
		ifFalse: [ self name ].
	^ ((' ' split: shortName) at: 1) asLowercase , self mooseID asString