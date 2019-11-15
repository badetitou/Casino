Extension { #name : #CSNUITabManager }

{ #category : #'*Casino-Model-Importer' }
CSNUITabManager >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	| aTab |
	aWidget addingPosition: anInvocation sourceAnchor startPos.
	(aWidget isKindOf: CSNUITab) ifTrue: [ ^ self addWidget: aWidget ].
	aTab := aFactory create: CSNUITab.
	aTab
		addAttribute:
			((aFactory create: CSNUITitle)
				attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ]);
				yourself).
	self addWidget: aTab.
	^ aTab addWidget: aWidget
]
