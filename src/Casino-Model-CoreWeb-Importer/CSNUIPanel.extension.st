Extension { #name : #CSNUIPanel }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [

	(self allParents , { self } includes: aWidget)
		ifFalse: [ 
			self layout
				ifNotNil: [ :layout | 
					layout
						addWidget: aWidget
						withInvocationOfAdd: anInvocation
						usingFactory: aFactory ]
				ifNil: [ 
					super
						addWidget: aWidget
						withInvocationOfAdd: anInvocation
						usingFactory: aFactory ] ]
		ifTrue: [ 
			('CSNCOntainer - AddWidgetWithInvocation: ' , aWidget printString
			 , ' is already present in the hierarchy') record ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> getSelectorFrom: anExporter [

	^ (self layout isNotNil and: [ self layout specificSelector ])
		  ifTrue: [ self layout getSelector ]
		  ifFalse: [ (anExporter angularRepresentationOf: self) getSelector ]
]
