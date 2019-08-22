"
| generator |
generator := BLMetamodelGenerator new.
generator builder traitsFlattening: true.
generator generate.
BLMetamodelGenerator resetMetamodel.
"
Class {
	#name : #CSNMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'widget',
		'action',
		'actionAppel',
		'service',
		'entity',
		'attribute',
		'actionAttribute',
		'normalAttribute',
		'variableAttribute',
		'behavior',
		'page',
		'businessPage',
		'actionService',
		'serviceAPI',
		'container',
		'leaf'
	],
	#category : #'Casino-Model-Generator'
}

{ #category : #accessing }
CSNMetamodelGenerator class >> packageName [
	^ #'Casino-Model'
]

{ #category : #accessing }
CSNMetamodelGenerator class >> prefix [
	^ #CSN
]

{ #category : #definition }
CSNMetamodelGenerator >> defineClasses [
	super defineClasses.
	action := builder newClassNamed: #Action comment: 'I do the link between UI and Behavioural meta-model (and I represent some specials other behavior)'.
	actionAppel := builder newClassNamed: #ActionAppel.
	entity := builder newClassNamed: #OriginedEntity comment: 'Root entity of the meta-model'.
	attribute := builder newClassNamed: #Attribute comment: 'I represent a characteritic that can be add to a Widget'.
	variableAttribute := builder newClassNamed: #VariableAttribute comment: 'I will be removed soon'.
	actionService := builder newClassNamed: #ActionService comment: 'I reprensent a call to a distant service'.
	page := builder newClassNamed: #Page comment: 'I represent the root of the user interface (A Windows, a web page)'.
	service := builder newClassNamed: #Service.
	serviceAPI := builder newClassNamed: #ServiceAPI.
	widget := builder newClassNamed: #Widget comment: 'I''m the main block of the user interface. Everything in a user interface is a widget with attributes'.
	container := builder newClassNamed: #Container comment: 'I''m a widget which can contain other widget (like a panel, a sub-"web page/window", a composite button)'.
	businessPage := builder newClassNamed: #BusinessPage comment: 'I''m specific to Berger-Levrault (company). Do not use me if you don''t know what you''re doing.'.
	leaf := builder newClassNamed: #Leaf comment: 'I reprensent a widget without sub-widget (like a paragraph, a text, a simple button, ...)'
]

{ #category : #definition }
CSNMetamodelGenerator >> defineHierarchy [
	super defineHierarchy.
	entity --|> #TNamed.
	entity --|> #TEntityMetaLevelDependency.
	entity <|-- action.
	entity <|-- attribute.
	entity <|-- serviceAPI.
	entity <|-- service.
	entity <|-- widget.
	widget <|-- container.
	widget <|-- leaf.
	container <|-- page.
	container <|-- businessPage.
	attribute <|-- variableAttribute.
	action <|-- actionService.
	action <|-- actionAppel
]

{ #category : #definition }
CSNMetamodelGenerator >> defineProperties [
	(entity property: #sources type: #Object)
		comment:
			'The sources of the element
It may reference multiple entity if the entity is defined in different context
example: in a JavaProgram and in a XML file'.
	(page property: #codePhase type: #String) comment: 'The unique code of the Phase'.
	(page property: #codeValue type: #String) comment: 'The short name of the codePhase'.
	(page property: #title type: #String) comment: 'The main title of the phase'.
	(page property: #subtitle type: #String) comment: 'The subtitle of the phase'.
	(businessPage property: #title type: #String) comment: 'The main title of the page metier'.
	(page property: #realClassName type: #String) comment: 'The name of the class in Java'.
	(widget property: 'realClass' type: #MooseEntity) comment: 'The type (class) of the widget'.
	(attribute property: 'attributeValue' type: #String) comment: 'The literal value of the attribute'.
	attribute property: #oldClass type: #Object.
	leaf property: #text type: #String.
	(service property: #targetPoint type: #String) comment: 'The url of the distant service'
]

{ #category : #definition }
CSNMetamodelGenerator >> defineRelations [
	((container property: #widgets) <>-* (widget property: #widgetContainer)) withNavigation.
	((widget property: #actions) <>-* (action property: #caller)) withNavigation.
	((widget property: #attributes) <>-* (attribute property: #widget)) withNavigation.
	((page property: #caller) <>-* (actionAppel property: #call)) withNavigation.
	((page property: #businessPage) *-* (businessPage property: #pageContainers) container) withNavigation; withoutPrimaryContainer.
	((service property: #actions) <>-* (serviceAPI property: #serviceOwner)) withNavigation
]

{ #category : #definition }
CSNMetamodelGenerator >> newBuilder [

	^ self builderWithStandardTraits
]
