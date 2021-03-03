Extension { #name : #CSNUIFieldset }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIFieldset >> angularComponent [
	^ CSNELCWBLFieldsetComponent new
	"^ MCCard"
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIFieldset >> getSelector [
	^ self angularComponent getSelector
]
