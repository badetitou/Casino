accessing
linkForAbstractTabPhase
	^ (self modelPhases
		select: [ :a | (a withSuperclassHierarchy collect: #name) anySatisfy: [ :name | 'AbstractTabPhaseController' = name ] ]
		thenCollect: [ :class | 
			class withSuperclassHierarchy
				collect: [ :c | 
					(c outgoingInvocations
						reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
						thenCollect: [ :invoc | invoc candidates at: 1 ])
						select: [ :e | e isConstructor and: [ self modelPageMetier includes: e parentType ] ]
						thenCollect: [ :e | class -> e parentType ] ] ]) flatten flatten