initialization
createWidgetInModel: aWidget
	| widget |
	widget := BLWidget new
		constructor: aWidget constructor;
		realClass: aWidget widgetClass;
		name: aWidget constructor asString;
		notFound: false.
	(self getPageMetierFromClass: aWidget link key)
		ifNotNil: [ :a | a widgets add: widget ]
		ifNil: [ (self getPhaseFromClass: aWidget link key)
				ifNotNil: [ :a | a widgets add: widget ]
				ifNil: [ widget notFound: true ] ].
	^ widget