Extension { #name : #CSNUIFieldset }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIFieldset >> angularComponent [
	"CSNELCWBLFieldsetComponent"
	^ MCCard
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIFieldset >> getSelector [
	^ self angularComponent getSelector
]
