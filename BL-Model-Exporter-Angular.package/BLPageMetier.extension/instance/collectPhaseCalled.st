*BL-Model-Exporter-Angular
collectPhaseCalled
	^ (self recursiveWidgets flatCollect: [ :widget | widget actionAppels collect: #to ]) asSet asOrderedCollection 