*BL-Model-Exporter-Angular
attributesTag
	^ self attributes
		associationsCollect: [ :attr | ^ '[' , attr key , ']="' ,( self convertIfString: attr value) , '" ' ]