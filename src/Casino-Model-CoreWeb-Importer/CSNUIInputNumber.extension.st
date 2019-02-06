Extension { #name : #CSNUIInputNumber }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputNumber class >> canHandle: anInvocation [
	^ #('BLTextBoxNumber' 'BLTextBoxAnnee' 'BLTextBoxNumeric' 'BLTextBoxAmount' 'BLTextBoxPercentage')
		includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputNumber class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'number'.
	'BLTextBoxAnnee' = anInvocation invokedClassName
		ifTrue: [ anInvocation parameters ifNotEmpty: [widget
				addAttribute:
					(CSNUIValue new
						attributeValue: (anInvocation parameters at: 1);
						yourself) ]
			].
					(#('BLTextBoxNumber' 'BLTextBoxAnnee') includes: anInvocation invokedClassName) ifTrue: [ widget
				addAttribute:
					(CSNAttribute new
						name: 'step';
						attributeValue: '1';
						yourself)  ]. 
	^ widget
]
