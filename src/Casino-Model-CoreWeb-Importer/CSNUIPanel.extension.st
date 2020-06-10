Extension { #name : #CSNUIPanel }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	(self allParents , {self} includes: aWidget)
		ifFalse: [ self layout addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory ]
		ifTrue: [ ('CSNCOntainer - AddWidgetWithInvocation: ' , aWidget printString , ' is already present in the hierarchy') record ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> getSelector [
	^ (self layout isNotNil and: [ self layout specificSelector ])
		ifTrue: [ self layout getSelector ]
		ifFalse: [ 'bl-panel' ]
]
