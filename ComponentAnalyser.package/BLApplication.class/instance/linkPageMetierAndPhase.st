accessing
linkPageMetierAndPhase
	^ self modelPageMetier
		flatCollect: [ :page | 
			page incomingReferences
				collect: [ :reference | Association new key: reference from belongsTo value: page ] ]