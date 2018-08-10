Extension { #name : #RTLegendBuilder }

{ #category : #'*BL-Model-Explorer' }
RTLegendBuilder >> addLineColorFadingFrom: startColor to: endColor text: textualDescription [
	"Add a fading between startColor and endColor. A textualDescription is provided"

	self addLineColorFadingUsing: (Array with: startColor with: endColor) text: textualDescription
]

{ #category : #'*BL-Model-Explorer' }
RTLegendBuilder >> addLineColorFadingUsing: colors text: textualDescription [
	"Specify a description of a fading using a provided set of colors"

	items
		add:
			(RTFadingColorLineLegendItem new
				colors: colors;
				description: textualDescription)
]
