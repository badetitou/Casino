*BL-Model-Exporter-Angular
getDom
	| text |
	self halt. 
	text := '<' , self getSelector , ' ' , self attributesTag , ' ' , self actionsTag 
		, ' >'.
	text := text , (self widgets flatCollect: [ :widget | widget getDom ]).
	text := text , '</' , self getSelector , '>'.
	^ text