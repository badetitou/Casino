*BL-Model-Exporter-Angular
collectPhaseCalled
	^ (self recursiveWidgets flatCollect: [ :localWidget | localWidget actionAppels collect: #phase ]) asSet asOrderedCollection 