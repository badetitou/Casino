as yet unclassified
getClassNamed: aClassName
	^ (self sourceModel allModelClasses select: [ :a | a mooseName = aClassName ]) at: 1