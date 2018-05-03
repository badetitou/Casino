*BL-Model-Exporter-Angular
id
	^ self variable isClass
		ifTrue: [ ((' ' split: self className) at: 1) asLowercase , self variable mooseID asString ]
		ifFalse: [ self variable name ]