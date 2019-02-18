Extension { #name : #CSNUILink }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUILink class >> canHandle: anInvocation [
	^ 'BLLinkLabel' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUILink class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute:
			(CSNUILabel new
				attributeValue:
					(anInvocation parameters ifNotEmpty: [ :parameters | parameters first ] ifEmpty: [ 'todo' ])).
	^ widget
]
