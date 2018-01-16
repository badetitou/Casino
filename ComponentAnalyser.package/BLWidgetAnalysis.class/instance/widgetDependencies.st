accessing
widgetDependencies
	^ (self modelWidget collect: [ :widget | widget -> (self computeWidgetView: widget)])
		asDictionary