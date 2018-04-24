*BL-Model-Importer-Java
createWidgetFor: anInvocation
	^ self new
		constructor: anInvocation;
		realClass: anInvocation invokedClass ;
		name: anInvocation asString;
		source: anInvocation;
		yourself