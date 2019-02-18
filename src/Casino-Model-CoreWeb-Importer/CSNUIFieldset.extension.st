Extension { #name : #CSNUIFieldset }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIFieldset class >> canHandle: anInvocation [
	^ #('BLFieldSetPanelDynamic' 'BLGroupBoxPanel' 'BLFieldSetPanel') includesAny: (anInvocation invokedClass withSuperclassHierarchy collect:  #invokedClassName)
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIFieldset class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (CSNUITitle new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ])).
	
	((anInvocation invokedClass withSuperclassHierarchy collect: #invokedClassName)
		includes: 'BLFieldSetPanelDynamic')
		ifTrue: [ widget addAttribute: CSNDynamicFieldset new.
			(anInvocation parameters at: 2 ifAbsent: [ '' ]) = 'true'
				ifTrue: [ widget addAttribute: CSNLightFieldset new ] ].
	((anInvocation invokedClass withSuperclassHierarchy collect: #invokedClassName)
		includes: 'BLGroupBoxPanel')
		ifTrue: [ widget addAttribute: CSNGroupFieldset new ].
	^ widget
]
