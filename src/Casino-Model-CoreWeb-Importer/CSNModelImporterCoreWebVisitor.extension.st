Extension { #name : #CSNModelImporterCoreWebVisitor }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNModelImporterCoreWebVisitor >> attributeFor: widget fromComponentUtilsForInvocation: anInvocation [
	"used by CSNUIParagraph"
	widget
		addAttribute:
			((self create: CSNUILabel)
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
			((self create: CSNUIClass)
				attributeValue: ((anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ]) removePrefix: 'BLLabel.'))
]
