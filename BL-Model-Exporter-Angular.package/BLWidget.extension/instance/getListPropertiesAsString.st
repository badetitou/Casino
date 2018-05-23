*BL-Model-Exporter-Angular
getListPropertiesAsString
	^ self getSelector, self attributesTag , self actionsTag
		, self parametersTag , self idTag.