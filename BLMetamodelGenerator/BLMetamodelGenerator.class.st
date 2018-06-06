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
		'phaseStandalone',
		'phaseNotStandalone',
		'pageMetier',
		'widget',
		'action',
		'actionAsynchrone',
		'actionAppel',
		'service'
	],
	#category : 'BLMetamodelGenerator'
}

{ #category : #accessing }
BLMetamodelGenerator class >> packageName [
	^ #'BLMetamodel-Generated'
]

{ #category : #accessing }
BLMetamodelGenerator class >> prefix [
	^ #BL
]

{ #category : #definition }
BLMetamodelGenerator >> defineClasses [
	phase := builder newClassNamed: #Phase.
	phaseStandalone := builder newClassNamed: #PhaseStandAlone.
	phaseNotStandalone := builder newClassNamed: #PhaseNotStandalone.
	pageMetier := builder newClassNamed: #PageMetier.
	widget := builder newClassNamed: #Widget.
	action := builder newClassNamed: #Action.
	actionAsynchrone := builder newClassNamed: #actionAsynchrone.
	actionAppel := builder newClassNamed: #actionAppel.
	service := builder newClassNamed: #Service.
	phase <|-- phaseStandalone.
	phase <|-- phaseNotStandalone.
	action <|-- actionAsynchrone.
	action <|-- actionAppel.
	phase --|> #TNamed
]

{ #category : #definition }
BLMetamodelGenerator >> defineProperties [
	(phase property: #codePhase type: #String)
		comment: 'The code phase (see xml file)'.
	(phase property: #codeValue type: #String)
		comment: 'The code value (see xml file)'.
	(phase property: #realClassName type: #String)
		comment: 'The realClassName (see xml file)'.
]

{ #category : #definition }
BLMetamodelGenerator >> defineRelations [
	phaseNotStandalone *-* pageMetier

	"pageMetier <>-* widget.
	phaseStandalone <>-* widget"

	"widget *-* action.
	actionAsynchrone *-* service.
	actionAppel *- phase"
]

{ #category : #definition }
BLMetamodelGenerator >> newBuilder [
	^ FmxNGGenerator builderWithDefinitions
		doNotGenerateCurrent;
		packageName: self class packageName;
		generator: self;
		traitsFlattening: true;
		yourself
]
