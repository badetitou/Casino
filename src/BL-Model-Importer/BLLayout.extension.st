Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Importer' }
BLLayout >> addWidget: aWidget [
	(BLCell new widget: aWidget; layoutOwner: self; yourself).
	^ aWidget
	
]
