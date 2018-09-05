Extension { #name : #BLUIInputColor }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputColor class >> canHandle: anInvocation [
	^ 'BLTextBoxColorPicker' = anInvocation invokedClassName
]
