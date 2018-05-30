*BL-Model-CoreWeb-Exporter
attributeMethod
	^ '/*
	' , ('', (self oldMethod flatCollect: #angularString)
		replaceAllRegex: 'onClick'
		with:
			self attributeValue)
				,
					'
*/'