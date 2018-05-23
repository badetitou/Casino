instance creation
newFor: aWidgetInstance
	"black magic... can receive nil as anInvocation see BLHorizontalPanel>>addDefaultAttribute"

	aWidgetInstance widgets
		do:
			[ :subWidget | subWidget addAttribute: (BLHorizontalChild new subpart: 12 / aWidgetInstance widgets size) ].
	^ self createAttributeFor: nil