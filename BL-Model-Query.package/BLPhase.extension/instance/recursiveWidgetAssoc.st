*BL-Model-Query
recursiveWidgetAssoc
	^ self recursiveWidget  collect: [ :el | Association new key: self value: el ]