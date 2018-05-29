private
searchWidgetFromConstructorInvocation: anInvocation
	^ (self listOfWidget select: [ :widget | widget constructor = anInvocation ]) at: 1 ifAbsent: [ ^nil ]