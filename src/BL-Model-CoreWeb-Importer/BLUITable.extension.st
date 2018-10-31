Extension { #name : #BLUITable }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITable class >> canHandle: anInvocation [
	^ #('BLTableList' 'FlexTable') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITable >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLUIDisabled
]
