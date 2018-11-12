Extension { #name : #BLUITable }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITable class >> canHandle: anInvocation [
	^ #('BLTableList') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITable >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLUIDisabled
]
