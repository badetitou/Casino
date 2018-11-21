Extension { #name : #BLUIInputTime }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputTime class >> canHandle: anInvocation [
	^ 'BLTextBoxTime' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputTime class >> createWidgetFor: anInvocation [
	"the test for the number of parameters come from experiment with GRH"
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'time'.
	anInvocation parameters
		ifNotEmpty: [ anInvocation parameters size >= 4
				ifTrue: [ widget
						addAttribute:
							(BLUIValue new
								text:
									(anInvocation parameters
										at: 4;
										yourself)) ] ].
	^ widget
]
