Extension { #name : #BLUILabel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUILabel class >> canHandle: anInvocation [
	^ ('BLLabel|Label|FactoryBLLabel' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUILabel >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUILabel class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addWidget:
			(BLUILeaf new
				text:
					(anInvocation parameters
						at: 1
						ifAbsent: [ self flag: #todo.
							'TODO' ])).
	widget parameters at: 'class' put: ((anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ]) removePrefix: 'BLLabel.').
	^ widget
]
