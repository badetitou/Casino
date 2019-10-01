Extension { #name : #CSNUIPanel }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	^ self layout addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> getSelector [
	^ (self layout isNotNil and: [ self layout specificSelector ])
		ifTrue: [ self layout getSelector ]
		ifFalse: [ 'bl-panel' ]
]
