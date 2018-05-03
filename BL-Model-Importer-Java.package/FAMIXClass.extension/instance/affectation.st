*BL-Model-Importer-Java
affectation
	"Compatibility with invocation for the creation of the widget"

	^ ((self container localVariables select: [ :el | el sourceAnchor isNotNil ])
		select: [ :localVariable | 
			localVariable sourceAnchor startPos < self sourceAnchor startPos
				and: [ localVariable sourceAnchor endPos > self sourceAnchor endPos ] ])
		at: 1
		ifAbsent: [ ((self container accesses select: #isWrite)
				select: [ :access | 
					access sourceAnchor startPos < self sourceAnchor startPos
						and: [ access sourceAnchor endPos + 5 > self sourceAnchor startPos ] ]) 
				at: 1 
				ifAbsent: [  ^ self ] ] 