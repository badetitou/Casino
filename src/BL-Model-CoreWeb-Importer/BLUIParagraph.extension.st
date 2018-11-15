Extension { #name : #BLUIParagraph }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIParagraph class >> attributeFor: widget fromComponentUtilsForInvocation: anInvocation [
	widget
		addAttribute:
			(BLUILabel new
				text:
					(anInvocation parameters at: 1 ifAbsent: [ '' ])
						,
							((anInvocation parameters at: 2 ifAbsent: [ '' ]) = 'true'
								ifTrue: [ '*' ]
								ifFalse: [ '' ])
						,
							((anInvocation parameters at: 5 ifAbsent: [ 'true' ]) = 'true'
								ifTrue: [ ':' ]
								ifFalse: [ '' ])).
	widget addAttribute: (BLUIClass new text: ((anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ]) removePrefix: 'BLLabel.'))
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIParagraph class >> canHandle: anInvocation [
	^ #('BLLabel' 'Label' 'FactoryBLLabel' 'ComponentUtils') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIParagraph >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLUIDisabled
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIParagraph class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	'ComponentUtils' = anInvocation invokedClassName
		ifTrue: [ self attributeFor: widget fromComponentUtilsForInvocation: anInvocation ]
		ifFalse: [ widget attributes add: (BLUILabel new text: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
			widget
				addAttribute:
					(BLUIClass new
						text:
							((anInvocation parameters size = 2
								ifTrue: [ ((anInvocation parameters at: 2) prefixMatchesRegex: 'BLLabel\..*')
										ifTrue: [ anInvocation parameters at: 2 ]
										ifFalse: [ 'NIVEAU2' ] ]
								ifFalse: [ anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ] ]) removePrefix: 'BLLabel.')) ].
	^ widget
]
