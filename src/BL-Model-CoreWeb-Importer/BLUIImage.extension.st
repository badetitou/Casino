Extension { #name : #BLUIImage }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIImage class >> canHandle: anInvocation [
	^ #('BLImage' 'BLImageButton' 'Image') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIImage class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #src
		put:
			BLWebModelJava webRoot
				,
					(((anInvocation parameters
						at: 1 ifAbsent: [ 'TODO' ]
						) replaceAllRegex: 'ConfigCSS.getSkinPath\(\).*\+' with: '') trim withoutPrefix: '"').
	^ widget
]
