initialization
getPageMetierFromClass: aClass
	(self listOfPageMetier select: [ :el | el name = aClass mooseName ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | ^ a at: 1 ]
	