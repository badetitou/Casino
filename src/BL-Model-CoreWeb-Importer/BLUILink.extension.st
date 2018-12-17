Extension { #name : #BLUILink }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUILink class >> canHandle: anInvocation [
	^ 'BLLinkLabel' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUILink class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute:
			(BLUILabel new
				attributeValue:
					(anInvocation parameters ifNotEmpty: [ :parameters | parameters first ] ifEmpty: [ 'todo' ])).
	^ widget
]
