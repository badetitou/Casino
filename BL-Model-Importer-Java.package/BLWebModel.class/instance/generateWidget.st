as yet unclassified
generateWidget
			"self widgetInstanceFromPhaseAndPageMetier
		do: [ :aWidgetInstance | self listOfWidget add: (self createWidgetInModel: aWidgetInstance) ]"
	self listOfWidgetContainer at: #noVar put: OrderedCollection new.
	self widgetInstance
		do: [ :widget | 

			widget affectedActions
				ifNotNil: [ :key | self listOfWidgetContainer at: widget variable put: widget ]
				ifNil: [ (self listOfWidgetContainer at: #noVar) add: widget ] ]