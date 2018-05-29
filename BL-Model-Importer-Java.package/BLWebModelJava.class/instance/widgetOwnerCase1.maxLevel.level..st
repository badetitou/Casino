as yet unclassified
widgetOwnerCase1: invocation maxLevel: maxLevel level: level
	| found |
	level = maxLevel
		ifTrue: [ ^ nil ].
	(invocation isNil or: [ invocation isNamespace ])
		ifTrue: [ ^ nil ].
	invocation isClass
		ifFalse: [ ^ self widgetOwnerCase1: invocation maxLevel: maxLevel level: level + 1 ]
		ifTrue: [ found := self getPhaseFromClass: invocation.
			found
				ifNotNil: [ ^ found ]
				ifNil: [ found := self getPageMetierFromClass: invocation.
					found ifNotNil: [ ^ found ].
					invocation incomingReferences ifNotEmpty: [ :references | ^ self widgetOwnerCase1: (references at: 1) from belongsTo maxLevel: maxLevel level: level + 1 ] ] ].
	^ self widgetOwnerCase1: invocation maxLevel: maxLevel level: level + 1 