Extension { #name : #FamixTClass }

{ #category : #'*Casino-Model-Exporter-Angular' }
FamixTClass >> notAnonymousClassContainer [
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass or: class isClass not ] ] whileTrue: [ class := class belongsTo  ].
	^ class
]

{ #category : #'*Casino-Model-Exporter-Angular' }
FamixTClass >> notAnonymousContainer [
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass ] ]
		whileTrue: [ class := class belongsTo ].
	^ class
]
