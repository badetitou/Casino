*BL-Model-CoreWeb-Exporter
getDom
	^ '<' , self getSelector , ' ' , self attributesTag , ' ' , self actionsTag , ' '
		, self parametersTag , ' />'