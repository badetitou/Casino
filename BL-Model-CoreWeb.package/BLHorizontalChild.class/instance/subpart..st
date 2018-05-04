accessing
subpart: anObject
	anObject < 1
		ifTrue: [ subpart := 1 ]
		ifFalse: [ subpart := anObject floor ]