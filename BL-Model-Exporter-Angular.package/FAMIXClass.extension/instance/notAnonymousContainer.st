*BL-Model-Exporter-Angular
notAnonymousContainer
	| class |
	class := self.
	[ class isNotNil and: [ class isAnonymousClass or: class isClass not ] ] whileTrue: [ class := class belongsTo  ].
	^ class