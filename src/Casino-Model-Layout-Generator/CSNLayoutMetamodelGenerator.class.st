"
| generator |
generator := CSNLayoutMetamodelGenerator new generate.
CSNLayoutMetamodelGenerator resetMetamodel.
"
Class {
	#name : #CSNLayoutMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
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
		'centerAlignement',
		'container',
		'widget',
		'entity',
		'border',
		'grid',
		'horizontal',
		'vertical'
	],
	#category : #'Casino-Model-Layout-Generator'
}

{ #category : #accessing }
CSNLayoutMetamodelGenerator class >> packageName [

	<ignoreForCoverage>
	^ 'Casino-Model-Layout'
]

{ #category : #accessing }
CSNLayoutMetamodelGenerator class >> prefix [

	<ignoreForCoverage>
	^ 'CSNL'
]

{ #category : #accessing }
CSNLayoutMetamodelGenerator class >> submetamodels [
	^ { CSNMetamodelGenerator  }
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
	
	"layouts"
	border := builder newClassNamed: #BorderLayout. 
	grid := builder newClassNamed: #GridLayout.
	horizontal  := builder newClassNamed: #HorizontalLayout.
	vertical := builder newClassNamed: #VerticalLayout.

	"sub alignement"
	northAlignement := builder newClassNamed: #NorthAlignement.
	northEastAlignement := builder newClassNamed: #NorthEastAlignement.
	eastAlignement := builder newClassNamed: #EastAlignement.
	southEastAlignement := builder newClassNamed: #SouthEastAlignement.
	southAlignement := builder newClassNamed: #SouthAlignement.
	southWestAlignement := builder newClassNamed: #SouthWestAlignement.
	westAlignement := builder newClassNamed: #WestAlignement.
	northWestAlignement := builder newClassNamed: #NorthWestAlignement.
	centerAlignement := builder newClassNamed: #CenterAlignement.
	
	"remote"
	container := self remoteEntity: #Container withPrefix: #CSN.
	widget := self remoteEntity: #Widget withPrefix: #CSN.
	entity := self remoteEntity: #OriginedEntity withPrefix: #CSN
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
	position --|> entity.
	size --|> entity.
	
	"layouts"
	grid --|> layout.
	border --|> layout.
	horizontal --|> layout.
	vertical --|> layout.

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
]

{ #category : #definition }
CSNLayoutMetamodelGenerator >> defineRelations [
	super defineRelations.
	((cell property: #layoutOwner) *-<> (layout property: #cell)) withNavigation.
	((layout property: #container) -<> (container property: #layout)) withNavigation.
	((cell property: #widget) <>- (widget property: #cellOwner))
		withNavigation;
		withoutPrimaryContainer.
	((widget property: #size) <>- (size property: #widget)) withNavigation.
	((widget property: #position) <>- (position property: #widget)) withNavigation
]
