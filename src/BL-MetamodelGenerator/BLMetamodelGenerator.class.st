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
		'serviceAction',
		'uiContainer',
		'uiLeaf',
		'behavior',
		'page',
		'businessPage'
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
	action := builder newClassNamed: #Action.
	actionAppel := builder newClassNamed: #ActionAppel.
	entity := builder newClassNamed: #OriginedEntity.
	attribute := builder newClassNamed: #Attribute.
	actionAttribute := builder newClassNamed: #ActionAttribute.
	variableAttribute := builder newClassNamed: #VariableAttribute.
	behavior := builder newClassNamed: #Behavior.
	serviceAction := builder newClassNamed: #ServiceAction.
	page := builder newClassNamed: #Page.
	service := builder newClassNamed: #Service.
	widget := builder newClassNamed: #Widget.
	uiContainer := builder newClassNamed: #UIContainer.
	businessPage := builder newClassNamed: #BusinessPage.
	uiLeaf := builder newClassNamed: #UILeaf
]

{ #category : #definition }
BLMetamodelGenerator >> defineNewClassesHierarchy [
	action --|> #TAssociation.
	entity --|> #TNamed.
	entity --|> #TWithSourceAnchor.
	entity <|-- attribute.
	entity <|-- behavior.
	entity <|-- service.
	entity <|-- widget.
	widget <|-- uiContainer.
	widget <|-- uiLeaf.
	uiContainer <|-- page.
	uiContainer <|-- businessPage.
	attribute <|-- variableAttribute.
	attribute <|-- actionAttribute.
	behavior <|-- serviceAction.
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
	(actionAttribute property: #codeMetierModel type: #Object) comment: 'The source code of the actions'.
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
	((service property: #actions) <>-* (serviceAction property: #serviceOwner)) withNavigation.
	((actionAttribute property: #behaviors) *-* (behavior property: #actionAttributes)) withNavigation
]

{ #category : #definition }
BLMetamodelGenerator >> newBuilder [
	^ FamixGenerator builderWithDefinitions
		doNotGenerateCurrent;
		generator: self;
		yourself
]
