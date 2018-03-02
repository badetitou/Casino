private
computeRelativeLineColorsFor: el from: methods
	^ Array
		with: (self computeLineColorFor: el from withBrightnessFrom: (methods select: [ :a | a key belongsTo = el from model ]))
		with: (self computeLineColorFor: el to withBrightnessFrom: (methods select: [ :a | a key belongsTo = el from model ]))