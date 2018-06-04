*BL-Model-CoreWeb-Importer
createWidgetFor: anInvocation
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