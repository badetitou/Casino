as yet unclassified
getPageMetierFromClass: aClass
	^ (self listOfPageMetier select: [ :el | el source = aClass ] )ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | ^ a at: 1 ]