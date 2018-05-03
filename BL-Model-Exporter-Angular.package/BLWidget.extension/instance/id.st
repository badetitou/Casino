*BL-Model-Exporter-Angular
id
	^ self variable isClass
		ifTrue: [ self variable uniqueName ]
		ifFalse: [ self variable name, self variable mooseID asString]