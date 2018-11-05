Extension { #name : #BLUISelect }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUISelect class >> canHandle: anInvocation [
	^ #('BLListBox' 'ListBox' 'BLMultiCombo') includes: anInvocation invokedClassName
]
