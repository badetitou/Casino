as yet unclassified
widgetInstance
	^ (self widgetConstructorsInvocation
		reject: [ :invocation | 
			(self widgetNamespace match: invocation from mooseName)
				or: [ '*noname#super*' match: invocation asString ] ])
		collect: [ :invocation | 
			| blWidget |
			blWidget := BLWidgetContainer new.
			blWidget blWidget: (BLWidget newFor: invocation).
			blWidget affectedActions: (self searchAffectationForInvocation: invocation).
			blWidget blWidget variable: blWidget variable.
			blWidget ]