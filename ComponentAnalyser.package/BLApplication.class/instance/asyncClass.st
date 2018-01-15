as yet unclassified
asyncClass
	^ (self model allClasses select: [ :e | e name = 'AsyncCallback' ]) at: 1