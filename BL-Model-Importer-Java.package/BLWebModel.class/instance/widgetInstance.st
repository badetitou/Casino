as yet unclassified
widgetInstance
	^ (self widgetConstructorsInvocation , self widgetAnonymousSubclasses
		reject: [ :invocationOrClass | 
			(self widgetNamespace match: invocationOrClass from mooseName)
				or: [ '*noname#super*' match: invocationOrClass asString ] ])
		collect: [ :invocation | 
			| blWidget |
			blWidget := BLWidgetContainer new.
			blWidget blWidget: (BLWidget newFor: invocation).
			blWidget affectedActions: (self searchAffectationForInvocationOrAnonymousClass: invocation).
			blWidget blWidget variable: blWidget variable.
			blWidget ]