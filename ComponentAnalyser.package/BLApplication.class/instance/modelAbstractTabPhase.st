accessing
modelAbstractTabPhase
	^ self modelPhases
		select: [ :a | (a withSuperclassHierarchy collect: #name) anySatisfy: [ :name | 'AbstractTabPhaseController' = name ] ]
	"	thenCollect: [ :class | 
			class withSuperclassHierarchy
				collect: [ :c | 
					c outgoingInvocations
						reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
						thenCollect: [ :invoc | class -> (invoc candidates at: 1) ] ] ]"