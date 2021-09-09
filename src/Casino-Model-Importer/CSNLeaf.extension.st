Extension { #name : #CSNLeaf }

{ #category : #'*Casino-Model-Importer' }
CSNLeaf >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	(self cacheAt: #incorrectWidgets ifAbsentPut: [ OrderedCollection new ]) add: aWidget 
]
