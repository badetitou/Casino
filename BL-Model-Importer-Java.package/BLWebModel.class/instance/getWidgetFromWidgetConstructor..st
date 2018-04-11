as yet unclassified
getWidgetFromWidgetConstructor: aConstructor
	^ (self listOfWidget select: [ :a | a constructor = aConstructor ])
		ifEmpty: [ ^ nil ]
		ifNotEmpty: [ :a | a at: 1 ]