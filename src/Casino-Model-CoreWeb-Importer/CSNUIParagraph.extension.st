Extension { #name : #CSNUIParagraph }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIParagraph class >> attributeFor: widget fromComponentUtilsForInvocation: anInvocation [
	widget
		addAttribute:
			(CSNUILabel new
				attributeValue:
					(anInvocation parameters at: 1 ifAbsent: [ '' ])
						,
							((anInvocation parameters at: 2 ifAbsent: [ '' ]) = 'true'
								ifTrue: [ '*' ]
								ifFalse: [ '' ])
						,
							((anInvocation parameters at: 5 ifAbsent: [ 'true' ]) = 'true'
								ifTrue: [ ':' ]
								ifFalse: [ '' ])).
	widget
		addAttribute:
			(CSNUIClass new
				attributeValue: ((anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ]) removePrefix: 'BLLabel.'))
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIParagraph class >> canHandle: anInvocation [
	^ #('BLLabel' 'Label' 'FactoryBLLabel' 'ComponentUtils') includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIParagraph class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	'ComponentUtils' = anInvocation invokedClassName
		ifTrue: [ self attributeFor: widget fromComponentUtilsForInvocation: anInvocation ]
		ifFalse: [ widget
				addAttribute: (CSNUILabel new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
			widget
				addAttribute:
					(CSNUIClass new
						attributeValue:
							((anInvocation parameters size = 2
								ifTrue: [ ((anInvocation parameters at: 2) prefixMatchesRegex: 'BLLabel\..*')
										ifTrue: [ anInvocation parameters at: 2 ]
										ifFalse: [ 'NIVEAU2' ] ]
								ifFalse: [ anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ] ])
								removePrefix: 'BLLabel.')) ].
	^ widget
]
