accessing
linkWidgetToAsync
	^ self modelAsync collect: [ :asyncClass | self modelWidgetInstance select: [ :b | b. self halt ] ]