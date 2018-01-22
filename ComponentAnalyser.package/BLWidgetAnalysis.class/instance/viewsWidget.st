accessing
viewsWidget
	^ (self modelWidget collect: [ :widget | widget -> (self computeWidgetView: widget)])
		asDictionary