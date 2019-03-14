Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> actionsTag [
	^ self actions
		flatCollect: [ :actionAppel | ' ' , actionAppel getAngularRepresentation ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> attributesTagWith: anExporter [
	^ ((self computeSelfAttributes flattened groupedBy: #name) asDictionary
		associationsCollect: [ :mapAttributeNameValues | 
			' ' , mapAttributeNameValues key , '="'
				,
					((mapAttributeNameValues value asOrderedCollection
						flatCollect: [ :attribute | (anExporter visit: attribute) , ' ' ])
						removeLast;
						yourself) , '"' ]) flatten
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> behaviors [
	^ self attributes collect: #behaviors
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> computeSelfAttributes [
	^ {self attributes. self getPositionAttribute. {self generateDefaultClassAttribute}. self containedElementAttribute } flattened
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> containedElementAttribute [
	^ self container ifNil: [ {  } ] ifNotNil: [ :a | a hierarchalAttributes ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> container [
	^ self cellOwner ifNil: [ self widgetContainer ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> generateDefaultClassAttribute [
	"Use me to add a Attribute to all the widget during the exportation
	ex: Adding a class to all the dom with the name of the widget"
	^ CSNAttribute new name: 'class'; attributeValue: ('ID-', self class name asString). 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getExternalDependencies [
	^ {self getExternalDependency.
	self getExternalDependency collect: #internalDependencies}
		flattened
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getExternalDependency [
	^ {}
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getListPropertiesAsStringWith: anExporter [
	^ self getSelector , (self attributesTagWith: anExporter)
		, self actionsTag , (self parametersTagWith: anExporter) , self idTag
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getPositionAttribute [
	^ self position ifNotNil: [ CSNUIStyle new name: 'style'; attributeValue: self position angularValue; yourself ] ifNil: [ {  } ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getSelector [
	^ 'div'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> hierarchalAttributes [ 
	^ {  }
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> id [
	^ self variable uniqueName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> idTag [
	^ self variable ifNil: [ '' ] ifNotNil: [ ' #' , self id ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> idViewChild [
	^ (self variable isNil or: [ self variable isInvocation ])
		ifTrue: [ '' ]
		ifFalse: [ '    @ViewChild(''' , self id , ''', { read: ViewContainerRef }) ' , self id
				, ': ViewContainerRef;' , String crlf ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> isPageMetier [
	^ false
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> parametersTagWith: anExporter [
	^ (self parameters
		associationsCollect: [ :attr | ' ' , attr key , '=' , (CSNModelExporterAngular convertIfString: (anExporter protectString: attr value)) ])
		flatten
]
