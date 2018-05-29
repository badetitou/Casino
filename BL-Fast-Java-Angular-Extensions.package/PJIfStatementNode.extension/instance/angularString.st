*BL-Fast-Java-Angular-Extensions
angularString
	| text |
	text := 'if (', self condition angularString , ')', self thenPart angularString .
	self elsePart ifNotNil: [ text := text , 'else ', self elsePart angularString ].
	^ text