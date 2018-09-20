Extension { #name : #BLUIInputTime }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputTime >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLCalendarShowIcon newFor: self)
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputTime class >> canHandle: anInvocation [
	^ 'BLTextBoxTime' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputTime class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #timeOnly put: 'true'.
	^ widget
]
