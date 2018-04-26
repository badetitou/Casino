*BL-Model-Importer-Java
affectation
	^ ((self from localVariables select: [ :el | el sourceAnchor isNotNil ])
		select: [ :localVariable | 
			localVariable sourceAnchor startPos < self sourceAnchor startPos
				and: [ localVariable sourceAnchor endPos > self sourceAnchor endPos ] ])
		at: 1
		ifAbsent: [ ((self from accesses select: #isWrite)
				select: [ :access | 
					access sourceAnchor startPos < self sourceAnchor startPos
						and: [ access sourceAnchor endPos + 5 > self sourceAnchor startPos ] ])
				at: 1
				ifAbsent: [ self from isInstanciationInitializer
						ifTrue: [ (((self from atScope: FAMIXClass) at: 1) attributes
								select: [ :attribute | 
									attribute sourceAnchor startPos < self sourceAnchor startPos
										and: [ attribute sourceAnchor endPos > self sourceAnchor endPos ] ]) at: 1 ifAbsent: [ ^ nil ] ] ] ]