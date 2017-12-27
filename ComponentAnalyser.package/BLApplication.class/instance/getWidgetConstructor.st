accessing
getWidgetConstructor
	| modelWidget |
	modelWidget := self modelWidget.
	^ self getConstructor
		select: [ :method | modelWidget includes: method parentType ]