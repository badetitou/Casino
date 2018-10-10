Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	cell add: (BLCell new addWidget: aWidget; yourself)
]
