Extension { #name : #BLUIInputNumber }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputNumber class >> canHandle: anInvocation [
	^ #('BLTextBoxNumber' 'BLTextBoxAnnee' 'BLTextBoxNumeric' 'BLTextBoxAmount' 'BLTextBoxPercentage')
		includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputNumber class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'number'.
	'BLTextBoxAnnee' = anInvocation invokedClassName
		ifTrue: [ widget
				addAttribute:
					(BLUIValue new
						text: (anInvocation parameters at: 1);
						yourself).
			].
					(#('BLTextBoxNumber' 'BLTextBoxAnnee') includes: anInvocation invokedClassName) ifTrue: [ widget
				addAttribute:
					(BLAttribute new
						name: 'step';
						attributeValue: '1';
						yourself)  ]. 
	^ widget
]
