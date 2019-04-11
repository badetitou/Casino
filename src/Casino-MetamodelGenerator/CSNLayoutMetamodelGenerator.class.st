"
| generator |
generator := CSNLayoutMetamodelGenerator new generate.
CSNLayoutMetamodelGenerator resetMetamodel.
"
Class {
	#name : #CSNLayoutMetamodelGenerator,
	#superclass : #CSNMetamodelGenerator,
	#instVars : [
		'layout',
		'cell',
		'size',
		'absoluteSize',
		'relativeSize',
		'position',
		'absolutePosition',
		'relativePosition',
		'alignement',
		'northAlignement',
		'northEastAlignement',
		'eastAlignement',
		'southEastAlignement',
		'southAlignement',
		'southWestAlignement',
		'westAlignement',
		'northWestAlignement',
		'centerAlignement'
	],
	#category : #'Casino-MetamodelGenerator'
}

{ #category : #accessing }
CSNLayoutMetamodelGenerator class >> resetMetamodel [
	" self resetMetamodel"

	| classes tower |
	FMRelationSlot allSubInstancesDo: #resetMooseProperty.
	classes := {CSNOriginedEntity withAllSubclasses.
	CSNAction withAllSubclasses} flatten asSet.
	classes addAll: #'Casino-Model' asPackage definedClasses.
	classes
		addAll: (self packageName asPackage definedClasses select: #isTrait).
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
CSNLayoutMetamodelGenerator >> defineClasses [
	"Main class"
	super defineClasses.
	layout := builder newClassNamed: #Layout.
	cell := builder newClassNamed: #Cell.
	size := builder newClassNamed: #Size.
	absoluteSize := builder newClassNamed: #AbsoluteSize.
	relativeSize := builder newClassNamed: #RelativeSize.
	position := builder newClassNamed: #Position.
	absolutePosition := builder newClassNamed: #AbsolutePosition.
	relativePosition := builder newClassNamed: #RelativePosition.
	alignement := builder newClassNamed: #Alignement.

	"sub alignement"
	northAlignement := builder newClassNamed: #NorthAlignement.
	northEastAlignement := builder newClassNamed: #NorthEastAlignement.
	eastAlignement := builder newClassNamed: #EastAlignement.
	southEastAlignement := builder newClassNamed: #SouthEastAlignement.
	southAlignement := builder newClassNamed: #SouthAlignement.
	southWestAlignement := builder newClassNamed: #SouthWestAlignement.
	westAlignement := builder newClassNamed: #WestAlignement.
	northWestAlignement := builder newClassNamed: #NorthWestAlignement.
	centerAlignement := builder newClassNamed: #CenterAlignement
]

{ #category : #definition }
CSNLayoutMetamodelGenerator >> defineHierarchy [
	"main hierarchy"

	super defineHierarchy.
	absoluteSize --|> size.
	relativeSize --|> size.
	absolutePosition --|> position.
	relativePosition --|> position.
	alignement --|> position.
	cell --|> widget.
	layout --|> entity.

	"alignement type hierarchy"
	northAlignement --|> alignement.
	northEastAlignement --|> alignement.
	eastAlignement --|> alignement.
	southEastAlignement --|> alignement.
	southAlignement --|> alignement.
	southWestAlignement --|> alignement.
	westAlignement --|> alignement.
	northWestAlignement --|> alignement.
	centerAlignement --|> alignement
]

{ #category : #definition }
CSNLayoutMetamodelGenerator >> defineProperties [
	super defineProperties.
	(widget property: #size type: #CSNSize) comment: 'The size of the widget'.
	(widget property: #position type: #CSNPosition) comment: 'The alignement of the widget'.
]

{ #category : #definition }
CSNLayoutMetamodelGenerator >> defineRelations [
	super defineRelations.
	((cell property: #layoutOwner) *-<> (layout property: #cell)) withNavigation.
	((layout property: #container) -<> (uiContainer property: #layout)) withNavigation.
	((cell property: #widget) <>- (widget property: #cellOwner)) withNavigation; withoutPrimaryContainer.
]

{ #category : #definition }
CSNLayoutMetamodelGenerator >> newBuilder [
	^ self builderWithStandardTraits
		doNotGenerateCurrent;
		generator: self;
		yourself
]
