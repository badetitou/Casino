adding
addOnClickAttribute
	(((self sourceModel allClasses select: [ :c | 'ClickHandler' match: c name ]) at: 1)
		subclassHierarchy select: [ :class | self isElementFromApplication: class ])
		do: [ :class | 
			(class allUsages collect: #receiver)
				do: [ :receiver | 
					self listOfWidgetContainer
						at: receiver
						ifPresent: [ :found | (found blWidget createAttributeFrom: class) ifNotNil: [:attribute | self listOfAttribute add: attribute ] ]
						ifAbsent: [  ] ] ]