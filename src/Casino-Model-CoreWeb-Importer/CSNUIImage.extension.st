Extension { #name : #CSNUIImage }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIImage class >> canHandle: anInvocation [
	^ #('BLImage' 'BLImageButton' 'BLDocButton' 'Image') includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIImage class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute:
			
					(CSNUISrc new
						attributeValue: CSNWebModelJava webRoot
				,
							('BLDocButton' = anInvocation invokedClassName
								ifTrue: [ 'images/boutons/bt_aide_fs.gif' ]
								ifFalse: [ ((anInvocation parameters at: 1 ifAbsent: [ 'TODO' ]) replaceAllRegex: 'ConfigCSS.getSkinPath\(\).*\+' with: '') trim withoutPrefix: '"' ])).
	^ widget
]
