*BL-Model-Exporter-Angular
idTag
	^ self variable ifNil: [ '' ] ifNotNil: [ 'id="' , self variable name , '" ' ]