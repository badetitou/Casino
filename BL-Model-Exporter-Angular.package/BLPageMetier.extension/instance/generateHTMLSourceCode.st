*BL-Model-Exporter-Angular
generateHTMLSourceCode
	| text |
	text := ''.
	self metiers
		ifNotEmpty: [ text := text , '<bl-tabs>' , String crlf
				,
					(self metiers
						flatCollect: [ :metier | 
							'    <bl-tab title=' , (BLModelExporterAngular convertIfString: metier title) , '>' , String crlf , '        ',metier getTag
								, String crlf , '    </bl-tab>' , String crlf ]) , '</bl-tabs>' , String crlf ].
	text := text , (self widgets flatCollect: [ :widget | widget getDom , String crlf ]).
	^ text