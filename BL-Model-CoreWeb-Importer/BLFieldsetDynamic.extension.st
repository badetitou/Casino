Extension { #name : #BLFieldsetDynamic }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLFieldsetDynamic class >> canHandle: anInvocation [
	^ ('BLFieldSetPanelDynamic|BLGroupBoxPanel' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLFieldsetDynamic class >> createWidgetFor: anInvocation [
	"(BLToggleable createAttributeFor: self)
	the usage of createAttributeFor: is black magic... We should not use createAttributeFor: but a specic new... But it's simpler for the comprenhension
	"
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget addAttribute: (BLToggleable createAttributeFor: self).
	^ widget
]
