Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIContainer >> attributesTag [
	^ (({self attributes. {self generateDefaultClassAttribute} } flatten)
		collect: [ :mapAttributeNameValues | 
			' ' , mapAttributeNameValues name , '="'
				,
					((mapAttributeNameValues value asOrderedCollection
						flatCollect: [ :attribute | attribute attributeValue asString , ' ' ]) removeLast; yourself)
				, '"' ]) flatten
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIContainer >> generateDefaultClassAttribute [
	"Use me to add a Attribute to all the widget during the exportation
	ex: Adding a class to all the dom with the name of the widget"
	^ BLAttribute new name: 'class'; attributeValue: ('ID-', self class name asString). 
]
