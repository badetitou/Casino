Extension { #name : #BLListBox }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLListBox class >> canHandle: anInvocation [
	^ #('BLListBox' 'ListBox') includes: anInvocation invokedClassName
]
