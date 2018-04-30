*BL-Model-Exporter-Angular
getDom
	| text |
	text := '<' , self getSelector , ' ' , self attributesTag , ' ' , self actionsTag , ' ', self parametersTag ,' >'.
	text := text , (self widgets flatCollect: #getDom ).
	text := text , '</' , self getSelector , '>'.
	^ text