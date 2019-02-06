Extension { #name : #CSNDialog }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNDialog class >> canHandle: anInvocation [
	^ 'BLDialogBox' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNDialog class >> createWidgetFor: anInvocation [
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
