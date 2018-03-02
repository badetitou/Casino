private
computeColorFor: aFAMIXClass
	(self isClassFromWidget: aFAMIXClass)
		ifTrue: [ ^ self coreColor ]
		ifFalse: [ (self isClassFromGWT: aFAMIXClass)
				ifTrue: [ ^ self gwtColor ] ].
	^ self appColor