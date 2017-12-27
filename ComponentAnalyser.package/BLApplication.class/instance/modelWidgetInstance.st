accessing
modelWidgetInstance
	^ modelWidgetInstanceCache
		ifNil: [ | modelWidget |
			modelWidget := self modelWidget.
			modelWidgetInstanceCache := modelWidget
				select: [ :link | modelWidget includes: link value ]
				thenCollect: [ :link | BLWidgetInstance new link: link ] ]