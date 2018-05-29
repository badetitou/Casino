as yet unclassified
getAsyncClassFrom: aServiceClass.
	^ (aServiceClass types asOrderedCollection 
		at: 1	ifAbsent: [ ^ {} ]) attributes
				collect: #declaredType
				thenSelect: [ :class | aServiceClass name , '*' match: class name ] 