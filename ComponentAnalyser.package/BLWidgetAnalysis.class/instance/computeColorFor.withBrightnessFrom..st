private
computeColorFor: aFAMIXClass withBrightnessFrom: references
	| color |
	color := self computeColorFor: aFAMIXClass.
	1 to:
		(references select: [ :assoc | assoc key = aFAMIXClass or: [ assoc value = aFAMIXClass ] ])
			size do: [ :i | color := color darker ].
	^ color