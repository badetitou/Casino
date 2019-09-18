Extension { #name : #CSNUIPanel }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	self layout addWidget: aWidget withInvocationOfAdd: anInvocation 
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> getSelector [
	^ (self layout isNotNil and: [ self layout specificSelector ])
		ifTrue: [ self layout getSelector ]
		ifFalse: [ 'bl-panel' ]
]
