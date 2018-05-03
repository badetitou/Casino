*BL-Model-Exporter-Angular
idTag
	^ self variable ifNil: [ '' ] ifNotNil: [ '#' , self id , ' ' ]