*BL-Model-Exporter-Angular
attributesTag
	^ self attributes
		associationsCollect: [ :attr | ^ '[' , attr key , ']="' , attr value , '" ' ]