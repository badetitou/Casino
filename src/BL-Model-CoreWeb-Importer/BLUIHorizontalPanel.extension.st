Extension { #name : #BLUIHorizontalPanel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHorizontalPanel >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLHorizontalParent newFor: self)
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHorizontalPanel class >> canHandle: anInvocation [
	^ '.*HorizontalPanel' asRegex matchesPrefix: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHorizontalPanel >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]
