Extension { #name : #BLUIHorizontalLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHorizontalLayout class >> canHandle: anInvocation [
	^ #('HorizontalPanel' 'BLHorizontalPanel') includes: anInvocation invokedClassName
]
