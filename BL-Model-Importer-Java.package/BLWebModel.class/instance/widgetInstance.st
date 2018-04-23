as yet unclassified
widgetInstance
	^ (self widgetConstructorsInvocation reject: [ :invocation | self widgetNamespace match: invocation from mooseName ])
		collect: [ :invocation | 
			"found := self widgetOwnerCase1: invocation from."
			BLWidget new
				constructor: invocation;
				realClass: (invocation candidates at: 1) parentType;
				name: invocation asString;
				source: invocation;
				yourself  ]