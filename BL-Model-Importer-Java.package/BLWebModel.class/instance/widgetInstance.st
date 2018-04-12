as yet unclassified
widgetInstance
	^ (self widgetConstructorsInvocation
		reject: [ :invocation | self widgetNamespace match: invocation from mooseName ])
		collect: [ :invocation  | 
			| found widget |
			found := self widgetOwnerCase1: invocation from.
			widget := BLWidget new
				constructor: invocation;
				realClass: (invocation candidates at: 1) parentType;
				name: invocation asString;
				notFound: found isNil;
				source: invocation.
				found ifNotNil: [ 
				found widgets add: widget. ].
				widget ]