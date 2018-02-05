accessing
modelContentWidget
		^ modelContentWidgetCache
		ifNil: [ modelContentWidgetCache := self model allModelClasses
				select: [ :e | 
					(e superclassHierarchy contains: [ :a | a name = 'IContentWidget' ])] ]