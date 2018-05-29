as yet unclassified
widgetOwnerCase1: invocation
	| found |
	(invocation isNil or: [ invocation isNamespace ])
		ifTrue: [ ^ nil ].
	invocation isClass
		ifFalse: [ ^ self widgetOwnerCase1: invocation belongsTo ]
		ifTrue: [ found := self getPhaseFromClass: invocation.
			found
				ifNotNil: [ ^ found ]
				ifNil: [ found := self getPageMetierFromClass: invocation.
					found ifNotNil: [ ^ found ].
					invocation incomingReferences ifNotEmpty: [ :references | ^ self widgetOwnerCase1: (references at: 1) from belongsTo maxLevel: 15 level: 0 ] ] ].
	^ self widgetOwnerCase1: invocation belongsTo