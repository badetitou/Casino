*ComponentAnalyser
addLineColorFadingFrom: startColor to: endColor text: textualDescription
	"Add a fading between startColor and endColor. A textualDescription is provided"

	self addLineColorFadingUsing: (Array with: startColor with: endColor) text: textualDescription