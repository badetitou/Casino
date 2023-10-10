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
			  ('CSNContainer - AddWidgetWithInvocation: ' , aWidget printString
			   , ' is already present in the hierarchy') record ]
]
