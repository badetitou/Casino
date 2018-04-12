as yet unclassified
widgetConstructorsInvocation
	^ (self modelWidget collect: [ :widget | 
		(widget methods select: #isConstructor) collect: #incomingInvocations.
		  ]) flattened