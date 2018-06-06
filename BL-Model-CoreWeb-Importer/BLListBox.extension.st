Extension { #name : #BLListBox }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLListBox class >> canHandle: anInvocation [
	^ ('BLListBox|ListBox' substrings: '|') includes: anInvocation invokedClassName
]
