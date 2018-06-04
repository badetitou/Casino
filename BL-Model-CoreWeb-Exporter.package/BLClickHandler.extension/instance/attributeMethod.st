*BL-Model-CoreWeb-Exporter
attributeMethod
	^ '/*
	'
		,
		"	('' , (self oldClass flatCollect: #angularString)
				replaceAllRegex: 'onClick'
				with: self attributeValue)
		,"
			'
*/'