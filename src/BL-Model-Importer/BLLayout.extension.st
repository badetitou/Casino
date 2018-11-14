Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Importer' }
BLLayout >> addWidget: aWidget [
	cell add: (BLCell new widget: aWidget; yourself).
	^ aWidget
	
]

{ #category : #'*BL-Model-Importer' }
BLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	cell
		add:
			(BLCell new
				widget: aWidget;
				yourself)
]
