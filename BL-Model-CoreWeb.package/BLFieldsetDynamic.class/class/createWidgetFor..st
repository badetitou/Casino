as yet unclassified
createWidgetFor: anInvocation
	"(BLToggleable createAttributeFor: self)
	the usage of createAttributeFor: is black magic... We should not use createAttributeFor: but a specic new... But it's simpler for the comprenhension
	"
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget addAttribute: (BLToggleable createAttributeFor: self).
	^ widget