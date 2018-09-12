Extension { #name : #BLUIPanel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel class >> canHandle: anInvocation [
	^ '.*Panel' asRegex matchesPrefix: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLWidth and: [ blAttributeClass ~= BLEnable ]
]
