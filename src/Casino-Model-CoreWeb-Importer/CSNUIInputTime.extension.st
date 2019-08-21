Extension { #name : #CSNUIInputTime }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputTime class >> canHandle: anInvocation [
	^ 'BLTextBoxTime' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputTime class >> createWidgetFor: anInvocation [
	"the test for the number of parameters come from experiment with GRH"
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'time'.
	anInvocation parameters
		ifNotEmpty: [ anInvocation parameters size >= 4
				ifTrue: [ widget
						addAttribute:
							(CSNUIValue new
								attributeValue:
									(anInvocation parameters
										at: 4;
										yourself)) ] ].
	^ widget
]
