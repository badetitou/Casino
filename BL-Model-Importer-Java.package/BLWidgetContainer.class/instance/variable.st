accessing
variable
	(self affectedActions isKindOf: FAMIXAccess) ifTrue: [ ^ self affectedActions variable ].
	^ self affectedActions