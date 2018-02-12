private
computeLineColorFor: aFAMIXMethod withBrightnessFrom: methods
	^ (self computeColorFor: aFAMIXMethod model)
		adjustBrightness:
			-1
				*
					(methods
						select: [ :assoc | assoc key belongsTo = aFAMIXMethod model or: [ assoc value belongsTo = aFAMIXMethod model ] ]
						thenCollect: #key) asSet size
				/ (methods select: [ :assoc | assoc key belongsTo = aFAMIXMethod model or: [ assoc value belongsTo = aFAMIXMethod model ] ]) size