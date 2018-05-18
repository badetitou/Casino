*BL-Model-Exporter-Angular
notAnonymousContainer
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass ] ]
		whileTrue: [ class := class belongsTo ].
	^ class