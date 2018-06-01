*BL-Model-Query
allAssociations
	^ self outgoingElement collect: [ :el | Association new key: self value: el ]