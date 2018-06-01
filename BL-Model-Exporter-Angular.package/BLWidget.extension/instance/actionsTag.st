*BL-Model-Exporter-Angular
actionsTag
	^ self actionAppels
		flatCollect: [ :actionAppel | ' ', actionAppel getAngularRepresentation ]