*BL-Model-Exporter-Angular
collectPhaseCalled
	^ self widgets flatCollect: [ :widget | widget actionsAppel collect: #to ]