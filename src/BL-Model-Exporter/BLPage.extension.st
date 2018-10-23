Extension { #name : #BLPage }

{ #category : #'*BL-Model-Exporter' }
BLPage >> accept: anExporter [
	^ anExporter visitBLPage: self
]

{ #category : #'*BL-Model-Exporter' }
BLPage >> hasMultiplePageMetier [
	^ self businessPage size > 1
]

{ #category : #'*BL-Model-Exporter' }
BLPage >> hasNoPageMetier [
	^ self businessPage isEmpty 
]

{ #category : #'*BL-Model-Exporter' }
BLPage >> visitSuccessorWith: anExporter [
	"to override"

	self pageMetiers do: [ :metier | anExporter visit: metier ]
]
