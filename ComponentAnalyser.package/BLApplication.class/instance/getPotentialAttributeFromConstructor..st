accessing
getPotentialAttributeFromConstructor: aConstructor
	| receiverVariable tmpWidget |
	tmpWidget := aConstructor.
	receiverVariable := nil.
	[ tmpWidget isNotNil and: [ receiverVariable isNil ] ]
		whileTrue: [ tmpWidget receiver ifNil: [ tmpWidget := tmpWidget previous ] ifNotNil: [ receiverVariable := tmpWidget receiver ] ].
	^ receiverVariable