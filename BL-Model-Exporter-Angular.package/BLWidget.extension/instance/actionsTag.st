*BL-Model-Exporter-Angular
actionsTag
	^ self actionsAppel flatCollect: [ :actionAppel | actionAppel getAngularRepresentation ]