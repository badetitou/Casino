private
getPotentialAttributeFromConstructor: aConstructor
	self flag: #stillWorkToDoWithLocalVariable.
	aConstructor receiver
		ifNotNil: [ :receiver | 
			receiver isImplicitVariable
				ifTrue: [ ^ aConstructor receiver ] ].
	aConstructor from name = '<Initializer>'
		ifTrue: [ ^ ((aConstructor from belongsTo attributes
				select: [ :a | a sourceAnchor startPos < aConstructor sourceAnchor startPos ])
				sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) last ].
	^ ((aConstructor from accesses
		select: [ :access | access isWrite and: [ access sourceAnchor endPos < aConstructor sourceAnchor startPos ] ])
		sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
		ifNotEmpty: [ :a | a last variable ]
		ifEmpty: [ ((aConstructor from localVariables
				select: [ :access | access sourceAnchor isNotNil and: [ access sourceAnchor startPos < aConstructor sourceAnchor startPos ] ])
				sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
				ifNotEmpty: [ :a | a last ]
				ifEmpty: [ ^ #notImplementedYet ] ]