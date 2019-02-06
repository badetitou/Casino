Extension { #name : #FAMIXClass }

{ #category : #'*Casino-Model-Exporter-Angular' }
FAMIXClass >> notAnonymousClassContainer [
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass or: class isClass not ] ] whileTrue: [ class := class belongsTo  ].
	^ class
]

{ #category : #'*Casino-Model-Exporter-Angular' }
FAMIXClass >> notAnonymousContainer [
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass ] ]
		whileTrue: [ class := class belongsTo ].
	^ class
]
