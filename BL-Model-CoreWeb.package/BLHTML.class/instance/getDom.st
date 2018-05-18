accessing
getDom
	^ ((self widgets asOrderedCollection
				sort:
					[ :widget1 :widget2 | widget1 source sourceAnchor startPos < widget2 source sourceAnchor startPos ])
				flatCollect: [ :widget | String crlf , widget getDom , String crlf ]) 