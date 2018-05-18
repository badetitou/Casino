*BL-Model-Exporter-Angular
notAnonymousClassContainer
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass or: class isClass not ] ] whileTrue: [ class := class belongsTo  ].
	^ class