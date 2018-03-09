*BL-Model-Query
accesses
	^ self recursiveMetierNode collect: [ :a | a -> metiers collect: #accessesAtLevel ]