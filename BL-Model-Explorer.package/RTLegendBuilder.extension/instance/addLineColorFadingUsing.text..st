*BL-Model-Explorer
addLineColorFadingUsing: colors text: textualDescription
	"Specify a description of a fading using a provided set of colors"

	items
		add:
			(RTFadingColorLineLegendItem new
				colors: colors;
				description: textualDescription)