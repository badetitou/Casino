Extension { #name : #FamixTClass }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FamixTClass >> shortName [

	^ self isAnonymousClass
		  ifTrue: [ 
			  | begin end |
			  begin := (self name findString: '(') + 1.
			  end := (self name findLastOccurrenceOfString: ')' startingAt: 0)
			         - 1.
			  "If this is really anonymous? - some strange case exist"
			  begin < end
				  ifTrue: [ self name copyFrom: begin to: end ]
				  ifFalse: [ self name ] ]
		  ifFalse: [ self name ]
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FamixTClass >> uniqueName [
	^ self shortName, self mooseID asString
]
