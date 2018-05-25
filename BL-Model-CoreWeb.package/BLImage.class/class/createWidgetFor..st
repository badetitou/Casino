meta
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #src
		put:
			BLWebModel webRoot
				,
					((anInvocation parameters
						at: 1 ifAbsent: [ 'TODO' ]
						) replaceAllRegex: 'ConfigCSS.getSkinPath\(\).*\+' with: '') trim.
	^ widget