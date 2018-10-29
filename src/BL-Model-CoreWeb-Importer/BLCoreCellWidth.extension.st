Extension { #name : #BLCoreCellWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreCellWidth class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'cellwidth' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreCellWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	(anInvocation from localVariables select: [:localVariable | localVariable name = (anInvocation parameters at: 1)]) ifNotEmpty: [:correspondingVariable | correspondingVariable first ].
	self halt. 
]
