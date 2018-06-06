Extension { #name : #FAMIXClass }

{ #category : #'*BL-Model-Exporter-Angular' }
FAMIXClass >> notAnonymousClassContainer [
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass or: class isClass not ] ] whileTrue: [ class := class belongsTo  ].
	^ class
]

{ #category : #'*BL-Model-Exporter-Angular' }
FAMIXClass >> notAnonymousContainer [
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass ] ]
		whileTrue: [ class := class belongsTo ].
	^ class
]
