private
linkFromWidgetActionAppel
	" At the end, collection of link (link = Association between a BLWidget and a BLPhase). Should have ~ 2000"
	^ self getPhaseCallInvocations
		collect: [ :el | 
			| link elContainer found |
			link := self linkFromWidgetActionAppelCase1: el.
			link ifNil: [ link := self linkFromWidgetActionAppelCase2: el. ].
			"elConstructor := el.
			[ elConstructor isNotNil and: [ (elConstructor candidates at: 1) isConstructor not ] ] whileTrue: [ elConstructor := elConstructor previous ].
			elConstructor
				ifNil: [ self listOfWidget
						do: [ :aBLWidget | 
							el from belongsTo isAnonymousClass
								ifTrue: [ | expectedVariable |
									expectedVariable := (self correspondingAccesses: el from belongsTo belongsTo accesses toInvocation: el)
										ifNotNil: [ :access | access variable ]
										ifNil: [ self correspondingAccesses: el from belongsTo belongsTo localVariables toInvocation: el ].
									expectedVariable
										ifNotNil: [ (self getPotentialAttributeFromConstructor: aBLWidget source constructor) = expectedVariable
												ifTrue: [ link := Association new key: aBLWidget value: (self searchCalledPhaseFromInvocation: el) ] ] ] ] ]
				ifNotNil: [ self listOfWidget
						do: [ :aBLWidget | 
							aBLWidget source constructor = elConstructor
								ifTrue: [ link := Association new key: aBLWidget value: (self searchCalledPhaseFromInvocation: el) ] ].
					link ifNil: [ self halt ] ]."
			link ]
		thenSelect: #isNotNil