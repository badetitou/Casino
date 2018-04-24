*BL-Model-Importer-Java
creatWidgetFor: anInvocation
	^ self new
		constructor: anInvocation;
		realClass: (anInvocation candidates at: 1) parentType;
		name: anInvocation asString;
		source: anInvocation;
		yourself