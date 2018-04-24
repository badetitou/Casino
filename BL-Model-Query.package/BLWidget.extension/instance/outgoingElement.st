*BL-Model-Query
outgoingElement
	^ self actionsAppel , (self widgets collect: [ :el | Association new key: self value: el ])