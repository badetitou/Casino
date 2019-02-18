Extension { #name : #CSNUISelect }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUISelect class >> canHandle: anInvocation [
	^ #('BLListBox' 'ListBox' 'BLMultiCombo') includes: anInvocation invokedClassName
]
