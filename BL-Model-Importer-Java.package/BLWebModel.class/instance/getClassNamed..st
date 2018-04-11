as yet unclassified
getClassNamed: aClassName
	^ (self sourceModel select: [ :a | a mooseName = aClassName ]) at: 1