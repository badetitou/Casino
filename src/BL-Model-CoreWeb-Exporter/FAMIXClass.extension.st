Extension { #name : #FAMIXClass }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
FAMIXClass >> shortName [
	^ self isAnonymousClass
		ifTrue: [ self name
				copyFrom: (self name findString: '(') + 1
				to: (self name findLastOccurrenceOfString: ')' startingAt: 0) - 1 ]
		ifFalse: [ self name ]
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
FAMIXClass >> uniqueName [
	^ self shortName, self mooseID asString
]
