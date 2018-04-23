as yet unclassified
widgetInstance
	^ (self widgetConstructorsInvocation
		reject: [ :invocation | self widgetNamespace match: invocation from mooseName ])
		collect: [ :invocation | 
			| blWidget |
			"found := self widgetOwnerCase1: invocation from."
			blWidget := BLWidgetContainer new.
			blWidget
				blWidget:
					(BLWidget new
						constructor: invocation;
						realClass: (invocation candidates at: 1) parentType;
						name: invocation asString;
						source: invocation;
						yourself).
			blWidget affectedActions: (self searchAffectationForInvocation: invocation). blWidget ]