Class {
	#name : #BLLayoutMetamodelGenerator,
	#superclass : #BLMetamodelGenerator,
	#instVars : [
		'layout',
		'cell',
		'size',
		'absoluteSize',
		'relativeSize',
		'position',
		'absolutePosition',
		'relativePosition',
		'alignement'
	],
	#category : #'BL-MetamodelGenerator'
}

{ #category : #accessing }
BLLayoutMetamodelGenerator class >> resetMetamodel [
	" self resetMetamodel"

	| classes tower |
	FMRelationSlot allSubInstancesDo: #resetMooseProperty.
	classes :=  {BLOriginedEntity withAllSubclasses. BLAction withAllSubclasses.} flatten asSet.
	classes addAll: #'BL-Model' asPackage definedClasses.
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
	tower := MooseModel metaBuilder: classes asOrderedCollection.
	self metamodel: tower metamodel.
	^ metamodel
]

{ #category : #definition }
BLLayoutMetamodelGenerator >> defineClasses [
	self defineNewClasses.
	self defineNewClassesHierarchy.
	
]

{ #category : #definition }
BLLayoutMetamodelGenerator >> defineNewClasses [
	super defineNewClasses.
	layout := builder newClassNamed: #Layout.
	cell := builder newClassNamed: #Cell.
	size := builder newClassNamed: #Size.
	absoluteSize := builder newClassNamed: #AbsoluteSize.
	relativeSize := builder newClassNamed: #RelativeSize.
	position := builder newClassNamed: #Position.
	absolutePosition := builder newClassNamed: #AbsolutePosition.
	relativePosition := builder newClassNamed: #RelativePosition.
	alignement := builder newClassNamed: #Alignement.
	
]

{ #category : #definition }
BLLayoutMetamodelGenerator >> defineNewClassesHierarchy [
	super defineNewClassesHierarchy.
	absoluteSize --|> size.
	relativeSize --|> size.
	absolutePosition --|> position.
	relativePosition --|> position.
	alignement --|> position.
	cell --|> uiContainer.
	layout --|> entity.
]

{ #category : #definition }
BLLayoutMetamodelGenerator >> defineProperties [
	super defineProperties 
]

{ #category : #definition }
BLLayoutMetamodelGenerator >> defineRelations [
	super defineRelations.
	((cell property: #layoutOwner) *-<> (layout property: #cell)) withNavigation.
	((layout property: #container) -<> (uiContainer property: #layout)) withNavigation.
	((size property: #widget) *-<> (widget property: #size)) withNavigation.
	((position property: #widget) *-<> (widget property: #position)) withNavigation.
]

{ #category : #definition }
BLLayoutMetamodelGenerator >> newBuilder [
	^ FamixGenerator builderWithDefinitions
		doNotGenerateCurrent;
		generator: self;
		yourself
]
