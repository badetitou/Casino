Extension { #name : #BLUIFieldsetDynamic }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldsetDynamic class >> canHandle: anInvocation [
	^ #('BLFieldSetPanelDynamic' 'BLGroupBoxPanel') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldsetDynamic >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldsetDynamic class >> createWidgetFor: anInvocation [
	"the usage of createAttributeFor: is black magic... We should not use createAttributeFor: but a specic new... But it's simpler for the comprenhension
	"

	| widget |
	widget := super createWidgetFor: anInvocation.
	widget addAttribute: (BLUITitle new text: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ])).
	BLToggleable createAttributeFrom: nil for: widget.
	widget parameters
		at: #legend
		put:
			(anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	^ widget
]
