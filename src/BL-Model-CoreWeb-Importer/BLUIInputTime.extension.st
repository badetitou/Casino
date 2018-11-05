Extension { #name : #BLUIInputTime }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputTime class >> canHandle: anInvocation [
	^ 'BLTextBoxTime' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputTime class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'time'.
	widget
		addAttribute:
			(BLUIValue new
				text:
					(anInvocation parameters
						at: 4;
						yourself)).
	^ widget
]
