*BL-Model-Exporter-Angular
getDom
	^ '<' , self getListPropertiesAsString , '>'
		,
			((self widgets asOrderedCollection
				sort:
					[ :widget1 :widget2 | widget1 source sourceAnchor startPos < widget2 source sourceAnchor startPos ])
				flatCollect:
					[ :widget | String crlf , widget getDom , String crlf ])
		, '</' , self getSelector , '>'