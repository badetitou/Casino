*BL-Model-Exporter-Angular
parametersTag
	^ (self parameters
		associationsCollect: [ :attr | ' ', attr key , '=' , (BLModelExporterAngular convertIfString: attr value) ]) flatten