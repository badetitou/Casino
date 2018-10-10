Extension { #name : #BLUIVerticalLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIVerticalLayout class >> canHandle: anInvocation [
	^ #('VerticalPanel' 'BLVerticalPanel') includes: anInvocation invokedClassName
]
