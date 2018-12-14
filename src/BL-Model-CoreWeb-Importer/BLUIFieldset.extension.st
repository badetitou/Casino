Extension { #name : #BLUIFieldset }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldset class >> canHandle: anInvocation [
	^ #('BLFieldSetPanelDynamic' 'BLGroupBoxPanel' 'BLFieldSetPanel') includesAny: (anInvocation invokedClass withSuperclassHierarchy collect:  #invokedClassName)
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldset class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (BLUITitle new text: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ])).
	
	((anInvocation invokedClass withSuperclassHierarchy collect: #invokedClassName)
		includes: 'BLFieldSetPanelDynamic')
		ifTrue: [ widget addAttribute: BLDynamicFieldset new.
			(anInvocation parameters at: 2 ifAbsent: [ '' ]) = 'true'
				ifTrue: [ widget addAttribute: BLLightFieldset new ] ].
	((anInvocation invokedClass withSuperclassHierarchy collect: #invokedClassName)
		includes: 'BLGroupBoxPanel')
		ifTrue: [ widget addAttribute: BLGroupFieldset new ].
	^ widget
]
