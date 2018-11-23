Extension { #name : #BLUIImage }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIImage class >> canHandle: anInvocation [
	^ #('BLImage' 'BLImageButton' 'BLDocButton' 'Image') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIImage class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute:
			
					(BLUISrc new
						attributeValue: BLWebModelJava webRoot
				,
							('BLDocButton' = anInvocation invokedClassName
								ifTrue: [ 'images/boutons/bt_aide_fs.gif' ]
								ifFalse: [ ((anInvocation parameters at: 1 ifAbsent: [ 'TODO' ]) replaceAllRegex: 'ConfigCSS.getSkinPath\(\).*\+' with: '') trim withoutPrefix: '"' ])).
	^ widget
]
