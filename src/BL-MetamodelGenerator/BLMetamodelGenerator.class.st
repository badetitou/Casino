"
| generator |
generator := BLMetamodelGenerator new.
generator builder traitsFlattening: true.
generator generate.
BLMetamodelGenerator resetMetamodel.
"
Class {
	#name : #BLMetamodelGenerator,
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
		'uiContainer',
		'uiLeaf',
		'behavior',
		'page',
		'businessPage',
		'actionService',
		'serviceAPI'
	],
	#category : #'BL-MetamodelGenerator'
}

{ #category : #accessing }
BLMetamodelGenerator class >> packageName [
	^ #'BL-Model'
]

{ #category : #accessing }
BLMetamodelGenerator class >> prefix [
	^ #BL
]

{ #category : #accessing }
BLMetamodelGenerator class >> resetMetamodel [
	" self resetMetamodel"

	| classes tower |
	FMRelationSlot allSubInstancesDo: #resetMooseProperty.
	classes :=  {BLOriginedEntity withAllSubclasses. BLAction withAllSubclasses} flatten asOrderedCollection.
	classes addAll: (self packageName asPackage definedClasses select: #isTrait).
	classes addAll: #'Famix-Traits' asPackage definedClasses.
	{Trait.
	Class.
	ClassDescription.
	Behavior.
	MooseModel.
	MooseAbstractGroup.
	MooseEntity.
	MooseGroup} do: [ :each | classes add: each ].
	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.
	^ metamodel
]

{ #category : #definition }
BLMetamodelGenerator >> defineClasses [
	self defineNewClasses.
	self defineNewClassesHierarchy.
	
]

{ #category : #definition }
BLMetamodelGenerator >> defineNewClasses [
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
	uiContainer := builder newClassNamed: #UIContainer comment: 'I''m a widget which can contain other widget (like a panel, a sub-"web page/window", a composite button)'.
	businessPage := builder newClassNamed: #BusinessPage comment: 'I''m specific to Berger-Levrault (company). Do not use me if you don''t know what you''re doing.'.
	uiLeaf := builder newClassNamed: #UILeaf comment: 'I reprensent a widget without sub-widget (like a paragraph, a text, a simple button, ...)'
]

{ #category : #definition }
BLMetamodelGenerator >> defineNewClassesHierarchy [
	actionAppel --|> #TAssociation.
	entity --|> #TNamed.
	entity --|> #TWithSourceAnchor.
	entity <|-- action.
	entity <|-- attribute.
	entity <|-- serviceAPI.
	entity <|-- service.
	entity <|-- widget.
	widget <|-- uiContainer.
	widget <|-- uiLeaf.
	uiContainer <|-- page.
	uiContainer <|-- businessPage.
	attribute <|-- variableAttribute.
	action <|-- actionService.
	action <|-- actionAppel
]

{ #category : #definition }
BLMetamodelGenerator >> defineProperties [
	(entity property: #source type: #MooseEntity) comment: 'The source of the element (from the importation)'.
	(page property: #codePhase type: #String) comment: 'The unique code of the Phase'.
	(page property: #codeValue type: #String) comment: 'The short name of the codePhase'.
	(page property: #title type: #String) comment: 'The main title of the phase'.
	(page property: #subtitle type: #String) comment: 'The subtitle of the phase'.
	(businessPage property: #title type: #String) comment: 'The main title of the page metier'.
	(page property: #realClassName type: #String) comment: 'The name of the class in Java'.
	(widget property: 'realClass' type: #MooseEntity) comment: 'The type (class) of the widget'.
	(attribute property: 'attributeValue' type: #String) comment: 'The literal value of the attribute'.
	attribute property: #oldClass type: #Object.
	uiLeaf property: #text type: #String
]

{ #category : #definition }
BLMetamodelGenerator >> defineRelations [
	((uiContainer property: #widgets) <>-* (widget property: #widgetContainer)) withNavigation.
	((widget property: #actions) <>-* (action property: #caller)) withNavigation.
	((widget property: #attributes) <>-* (attribute property: #widget)) withNavigation.
	((page property: #caller) -* (actionAppel property: #call)) withNavigation.
	((page property: #businessPage) *-* (businessPage property: #pageContainers)) withNavigation.
	((service property: #actions) <>-* (serviceAPI property: #serviceOwner)) withNavigation
]

{ #category : #definition }
BLMetamodelGenerator >> newBuilder [
	^ FamixGenerator builderWithDefinitions
		doNotGenerateCurrent;
		generator: self;
		yourself
]
