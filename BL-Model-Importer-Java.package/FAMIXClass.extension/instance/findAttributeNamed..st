*BL-Model-Importer-Java
findAttributeNamed: anAttributeName
	(self attributes select: [ :localVariable | localVariable name = anAttributeName ]) ifNotEmpty: [ :results | ^ results at: 1 ].
	^ nil