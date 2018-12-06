Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> actionsTag [
	^ (self actions reject: [ :action | action call isNil ])
		flatCollect: [ :actionAppel | ' ', actionAppel getAngularRepresentation ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> attributesTagWith: anExporter [
	^ ((self computeSelfAttributes flattened groupedBy: #name) asDictionary
		associationsCollect: [ :mapAttributeNameValues | 
			' ' , mapAttributeNameValues key , '="'
				,
					((mapAttributeNameValues value asOrderedCollection
						flatCollect: [ :attribute | (anExporter visit: attribute) , ' ' ])
						removeLast;
						yourself) , '"' ]) flatten
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> behaviors [
	^ self attributes collect: #behaviors
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> computeSelfAttributes [
	^ {self attributes. self getPositionAttribute. {self generateDefaultClassAttribute}. self containedElementAttribute } flattened
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> containedElementAttribute [
	^ self container ifNil: [ {  } ] ifNotNil: [ :a | a hierarchalAttributes ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> container [
	^ self cellOwner ifNil: [ self widgetContainer ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> generateDefaultClassAttribute [
	"Use me to add a Attribute to all the widget during the exportation
	ex: Adding a class to all the dom with the name of the widget"
	^ BLAttribute new name: 'class'; attributeValue: ('ID-', self class name asString). 
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getExternalDependencies [
	^ {self getExternalDependency.
	self getExternalDependency collect: #internalDependencies}
		flattened
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getExternalDependency [
	^ {}
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getListPropertiesAsStringWith: anExporter [
	^ self getSelector , (self attributesTagWith: anExporter) , self actionsTag
		, (self parametersTagWith: anExporter) , self idTag
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getPositionAttribute [
	^ self position ifNotNil: [ BLUIStyle new name: 'style'; attributeValue: self position angularValue; yourself ] ifNil: [ {  } ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getSelector [
	^ 'div'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> hierarchalAttributes [ 
	^ {  }
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> id [
	^ self variable shortName, self mooseID asString
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> idTag [
	^ self variable ifNil: [ '' ] ifNotNil: [ ' #' , self id ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> idViewChild [
	^ (self variable isNil or: [ self variable isInvocation ])
		ifTrue: [ '' ]
		ifFalse: [ '    @ViewChild(''' , self id , ''', { read: ViewContainerRef }) ' , self id
				, ': ViewContainerRef;' , String crlf ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> isPageMetier [
	^ false
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> parametersTagWith: anExporter [
	^ (self parameters
		associationsCollect: [ :attr | ' ' , attr key , '=' , (BLModelExporterAngular convertIfString: (anExporter protectString: attr value)) ])
		flatten
]
