Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Importer' }
BLLayout >> addWidget: aWidget [
	self cell add: (BLCell new widget: aWidget; yourself).
	^ aWidget
	
]
