*BL-Model-Exporter-Angular
generateHTMLSourceCode
	| text |
	text := ''.
	self widgets do: [ :widget | text := text , widget getTag, String crlf ].
	^ text