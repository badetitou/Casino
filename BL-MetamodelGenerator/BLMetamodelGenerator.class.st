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
		'phase',
		'pageMetier',
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
		'behavior'
	],
	#category : 'BL-MetamodelGenerator'
}

{ #category : #accessing }
BLMetamodelGenerator class >> packageName [
	^ #'BL-Model'
]

{ #category : #accessing }
BLMetamodelGenerator class >> prefix [
	^ #BL
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
	normalAttribute := builder newClassNamed: #NormalAttribute.
	variableAttribute := builder newClassNamed: #VariableAttribute.
	behavior := builder newClassNamed: #Behavior.
	serviceAction := builder newClassNamed: #ServiceAction.
	phase := builder newClassNamed: #Phase.
	service := builder newClassNamed: #Service.
	widget := builder newClassNamed: #Widget.
	uiContainer := builder newClassNamed: #UIContainer.
	pageMetier := builder newClassNamed: #PageMetier.
	uiLeaf := builder newClassNamed: #UILeaf.
	
	
]

{ #category : #definition }
BLMetamodelGenerator >> defineNewClassesHierarchy [

	action --|> #TAssociation.
	entity --|> #TNamed.
	entity --|> #TWithSourceAnchor.
	

	entity <|-- attribute.
	entity <|-- behavior.
	entity <|-- phase.
	entity <|-- service.
	entity <|-- widget.
	widget <|-- uiContainer.
	widget <|-- uiLeaf.
	uiContainer <|-- pageMetier.
	attribute <|-- variableAttribute.
	attribute <|-- normalAttribute.
	attribute <|-- actionAttribute.
	behavior <|-- serviceAction.
	action <|-- actionAppel.
	
]

{ #category : #definition }
BLMetamodelGenerator >> defineProperties [
	(entity property: #source type: #MooseEntity)
		comment: 'The source of the element (from the importation)'.
	(phase property: #codePhase type: #String)
		comment: 'The unique code of the Phase'.
	(phase property: #codeValue type: #String)
		comment: 'The short name of the codePhase'.
	(phase property: #realClassName type: #String)
		comment: 'The name of the class in Java'.
	(actionAttribute property: #codeMetierModel type: #Object)
		comment: 'The source code of the actions'.
	(widget property: 'realClass' type: #MooseEntity)
		comment: 'The type (class) of the widget'.
	(attribute property: 'attributeValue' type: #String)
		comment: 'The literal value of the attribute'.
	
]

{ #category : #definition }
BLMetamodelGenerator >> defineRelations [
	(uiContainer <>-* widget) withNavigation.
	(widget <>-* actionAppel) withNavigation.
	(widget <>-* attribute) withNavigation.
	(actionAppel *- phase) withNavigation.
	(phase *-* pageMetier) withNavigation.
	(service <>-* serviceAction) withNavigation.
	(actionAttribute *-* behavior) withNavigation
]

{ #category : #definition }
BLMetamodelGenerator >> newBuilder [
	^ FmxNGGenerator builderWithDefinitions
		doNotGenerateCurrent;
		generator: self;
		yourself
]
