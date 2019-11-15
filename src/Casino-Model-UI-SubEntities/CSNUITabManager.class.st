Class {
	#name : #CSNUITabManager,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #meta }
CSNUITabManager class >> annotation [

	<MSEClass: #TabManager super: #CSNContainer>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #adding }
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
