*BL-Model-Exporter-Angular
attributesTag
	^ self attributes
		associationsCollect:
			[ :attr | ^ '[' , attr key , ']=' , (BLModelExporterAngular convertIfString: attr value) , ' ' ]