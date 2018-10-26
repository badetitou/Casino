Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Importer' }
BLLayout >> addWidget: aWidget [
	cell add: (BLCell new widget: aWidget; yourself).
	^ aWidget
	
]
