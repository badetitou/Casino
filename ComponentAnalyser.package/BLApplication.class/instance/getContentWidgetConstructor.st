accessing
getContentWidgetConstructor
	| modelWidget |
	modelWidget := self modelContentWidget.
	^ self getConstructor select: [ :method | modelWidget includes: method parentType ]