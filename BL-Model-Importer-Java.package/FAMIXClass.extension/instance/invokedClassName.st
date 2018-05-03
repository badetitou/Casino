*BL-Model-Importer-Java
invokedClassName
	"I define this method for compatibility purpose with Invocation for method BLWebModel>>#widgetInstance 
	The goal is juste to find if an Anonymous class belongs to the widget namespace or not"

	^ self isAnonymousClass
		ifTrue: [ self name copyFrom: (self name findString: '(') + 1
		to: (self name  findLastOccurrenceOfString: ')' startingAt: 0) - 1 ]
		ifFalse: [ self name ]