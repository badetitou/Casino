*BL-Model-Exporter-Angular
getDom
	| text |
	text := '<' , self getSelector , '>'.
	text := text
		, (self widgets flatCollect: [ :widget | widget getDom]).
	text := text , '</' , self getSelector , '>'.
	^ text