Extension { #name : #BLDialog }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLDialog class >> canHandle: anInvocation [
	^ 'BLDialogBox' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLDialog class >> createWidgetFor: anInvocation [
	| widget |
	widget := super
		createWidgetFor:
			anInvocation.
	widget
		parameters
		at:
			#header
		put:
			(anInvocation
				parameters
				at: 1
				ifAbsent:
					[ 
					'todo' ]).
	^ widget
]
