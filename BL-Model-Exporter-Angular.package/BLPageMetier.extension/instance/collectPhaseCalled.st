*BL-Model-Exporter-Angular
collectPhaseCalled
	^ (self recursiveWidgets flatCollect: [ :widget | widget actionsAppel collect: #to ]) asSet asOrderedCollection 