*BL-Model-Query
outgoingElement
	^ actionsAppel , self widgets collect: [ :el | Association new key: self value: el ]