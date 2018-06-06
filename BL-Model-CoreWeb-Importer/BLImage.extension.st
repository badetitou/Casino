Extension { #name : #BLImage }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLImage class >> canHandle: anInvocation [
	^ ('BLImage|BLImageButton|Image' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLImage class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #src
		put:
			BLWebModelJava webRoot
				,
					((anInvocation parameters
						at: 1 ifAbsent: [ 'TODO' ]
						) replaceAllRegex: 'ConfigCSS.getSkinPath\(\).*\+' with: '') trim.
	^ widget
]
