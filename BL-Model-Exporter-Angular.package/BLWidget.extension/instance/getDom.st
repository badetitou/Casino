*BL-Model-Exporter-Angular
getDom
	| text |
	text := '<' , self getSelector , ' ' , self attributesTag , ' ' , self actionsTag , ' ' , self parametersTag , ' >'.
	text := text
		, ((self widgets asOrderedCollection sort: [ :widget1 :widget2 | widget1 source sourceAnchor startPos < widget2 source sourceAnchor startPos ]) flatCollect: #getDom).
	text := text , '</' , self getSelector , '>'.
	^ text