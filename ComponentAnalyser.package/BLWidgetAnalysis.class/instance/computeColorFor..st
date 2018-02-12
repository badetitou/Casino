private
computeColorFor: aFAMIXClass
	(self isClassFromWidget: aFAMIXClass)
		ifTrue: [ ^ self widgetColor ]
		ifFalse: [ (self isClassFromGWT: aFAMIXClass)
				ifTrue: [ ^ self gwtColor ] ].
	^ self appColor 