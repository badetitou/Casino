Extension { #name : #BLColorPicker }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLColorPicker class >> canHandle: anInvocation [
	^ 'BLTextBoxColorPicker' = anInvocation invokedClassName
]
