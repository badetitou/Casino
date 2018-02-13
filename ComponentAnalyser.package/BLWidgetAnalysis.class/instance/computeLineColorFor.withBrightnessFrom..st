private
computeLineColorFor: aFAMIXMethod withBrightnessFrom: methods
	| color |
	color := self computeColorFor: aFAMIXMethod model.
	1 to: (methods
						select:
							[ :assoc | assoc key belongsTo = aFAMIXMethod model or: [ assoc value belongsTo = aFAMIXMethod model ] ]
						thenCollect: #key) asSet size do: [ :i | color := color darker ].
	^ color