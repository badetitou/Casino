accessing
linkPageMetierAndPhaseConstructor
	^ (self model allModelMethods
		select: #isConstructor
		thenCollect: [ :method | 
			"thenCollect: [ :method | ((method queryAll: #in) atScope: FAMIXClass) from parentType ]"
			| got |
			got := (method queryAll: #in) atScope: FAMIXClass.
			got
				ifNotEmpty: [ got collect: [ :p | Association new key: p value: method parentType ] ] ]) flatten