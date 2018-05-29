as yet unclassified
generateWidget
	self listOfWidgetContainer at: #noVar put: OrderedCollection new.
	self widgetInstance
		do: [ :widget | 
			widget affectedActions
				ifNotNil: [ :key | self listOfWidgetContainer at: widget variable put: widget ]
				ifNil: [ (self listOfWidgetContainer at: #noVar) add: widget ] ]