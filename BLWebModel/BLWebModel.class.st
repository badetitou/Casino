"
""Generate BlApp""
aw := AnalyseCommand new.
""fileName := 'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.""
fileName := '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'.
xml := aw getXmlFile: fileName.
""mseFile := StandardFileStream fileNamed:  'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .""
mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/GeneralXmlui.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
""mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE'.""
mooseModel rootFolder: '/home/badetitou/Document/PFE/'.
blApp := BLApplication new model: mooseModel; applicationXml: xml ; sourceApp: './Source/BLCoreIncubatorGwt/'; sourceCore: './Source/BLCore-6.1.4/'.

blApp resetCache.
blApp linkViewPPContentWXmlUIService.

blApp linkFromConstructor.

blApp resetCache.
blApp linkFromConstructorWithoutSuperCall.

blApp linkXmlUi.

blApp linkXmlUiPhaseAndPageMetier.
blApp linkPhasePageMetierToPhasePageMetierFromConstructor.

blApp linkXmlUiSuperClass.

blApp modelPageMetier.

blApp linkPageMetierToPageMetier.

{blApp modelPhases , blApp modelPageMetier } flatten select: [ :a | '*XMLUi' match: a superclass mooseName ].

""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.

""Generate Bl Model""
model := MooseModel new name: 'blMooseModel'; yourself.
BLMooseModelCreator runOn: model from: blApp.

""Add Model to moose panel""
MooseModel root add: model.

"
Class {
	#name : #BLWebModel,
	#superclass : #Object,
	#instVars : [
		'pageMetierGroup',
		'phaseGroup',
		'widgetGroup',
		'actionGroup',
		'model',
		'listOfService'
	],
	#category : 'BLWebModel'
}

{ #category : #initialization }
BLWebModel >> addLinkPhaseToPageMetierFrom: aBlApplication [
	| phaseName |
	phaseName := self listOfPhases collect: #realClassName.
	(aBlApplication linkFromConstructor
		collect: [ :a | (self getPhaseFromClass: a key) -> (self getPageMetierFromClass: a value) ]
		thenSelect: [ :a | a key isNotNil and: [ a value isNotNil ] ]) do: [ :assoc | assoc key metiers add: assoc value ]
]

{ #category : #initialization }
BLWebModel >> addListsToModel [
	model addAll: self listOfPhases.
	model addAll: self listOfPageMetier.
	model addAll: self listOfWidget.
	model addAll: self listOfService.
]

{ #category : #initialization }
BLWebModel >> createModelIn: aModel from: aBlApplication [
	model := aModel.
	self generatePhasefrom: aBlApplication.
	self generatePageMetierfrom: aBlApplication.
	self addLinkPhaseToPageMetierFrom: aBlApplication.
	self generateWidgetfrom: aBlApplication.
	self generateBLActionAppelFrom: aBlApplication.
	self generateServicefrom: aBlApplication.
	self addListsToModel
]

{ #category : #initialization }
BLWebModel >> createPageMetierInModel: aPageMetier [
	^ BLPageMetier new name: aPageMetier mooseName
]

{ #category : #initialization }
BLWebModel >> createPhaseInModel: aPhase [
	^ BLPhase new
		name: aPhase codeValue;
		realClassName: aPhase realClassName;
		codeValue: aPhase codeValue;
		codePhase: aPhase codePhase;
		yourself 
]

{ #category : #initialization }
BLWebModel >> createServiceFromClass: aServiceClass [
	^ BLService new name: aServiceClass mooseName 
]

{ #category : #initialization }
BLWebModel >> createWidgetInModel: aWidget [
	| widget |
	widget := BLWidget new
		constructor: aWidget constructor;
		realClass: aWidget widgetClass;
		name: aWidget constructor asString;
		notFound: false.
	(self getPageMetierFromClass: aWidget link key)
		ifNotNil: [ :a | a widgets add: widget ]
		ifNil: [ (self getPhaseFromClass: aWidget link key)
				ifNotNil: [ :a | a widgets add: widget ]
				ifNil: [ widget notFound: true ] ].
	^ widget
]

{ #category : #initialization }
BLWebModel >> generateBLActionAppelFrom: aBlApplication [
	aBlApplication linkWidgetFromPPPhase
		do: [ :el | 
			| action |
			action := BLActionAppel new.
			(self getWidgetFromWidgetConstructor: el key constructor) actionsAppel add: action.
			(self getPhaseFromClass: el value) actions add: action. ]
]

{ #category : #initialization }
BLWebModel >> generatePageMetierfrom: aBlApplication [
	aBlApplication modelPageMetier
		do:
			[ :aPhase | self listOfPageMetier add: (self createPageMetierInModel: aPhase) ]
]

{ #category : #initialization }
BLWebModel >> generatePhasefrom: aBlApplication [
	aBlApplication phases do: [ :aPhase | self listOfPhases add: (self createPhaseInModel: aPhase) ]
]

{ #category : #initialization }
BLWebModel >> generateServicefrom: aBlApplication [
	aBlApplication modelServices
		do: [ :aServiceClass | self listOfService  add: (self createServiceFromClass: aServiceClass ) ]
]

{ #category : #initialization }
BLWebModel >> generateWidgetfrom: aBlApplication [
	aBlApplication modelWidgetInstanceFromPhaseAndPageMetier
		do: [ :aWidgetInstance | self listOfWidget add: (self createWidgetInModel: aWidgetInstance ) ]
]

{ #category : #initialization }
BLWebModel >> getPageMetierFromClass: aClass [
	(self listOfPageMetier select: [ :el | el name = aClass mooseName ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | ^ a at: 1 ]
	
]

{ #category : #initialization }
BLWebModel >> getPhaseFromClass: aClass [
	^ (self listOfPhases select: [ :a | a realClassName = aClass mooseName ]) ifEmpty: [ ^nil ] ifNotEmpty: [:a | a at: 1]. 
	
]

{ #category : #initialization }
BLWebModel >> getWidgetFromWidgetConstructor: aConstructor [
	^ (self listOfWidget select: [ :a | a constructor = aConstructor ])
		ifEmpty: [ ^ nil ]
		ifNotEmpty: [ :a | a at: 1 ]
]

{ #category : #initialization }
BLWebModel >> initialize [
	super initialize.
	pageMetierGroup := OrderedCollection new.
	phaseGroup := OrderedCollection new.
	widgetGroup := OrderedCollection new.
	actionGroup := OrderedCollection new.
	listOfService := OrderedCollection new.
]

{ #category : #initialization }
BLWebModel >> listOfPageMetier [
	^ pageMetierGroup
]

{ #category : #initialization }
BLWebModel >> listOfPhases [
	^ phaseGroup
]

{ #category : #initialization }
BLWebModel >> listOfService [
	^ listOfService
]

{ #category : #initialization }
BLWebModel >> listOfWidget [
	^ widgetGroup
]

{ #category : #initialization }
BLWebModel >> model [
	^ model
]

{ #category : #initialization }
BLWebModel >> model: anObject [
	model := anObject
]
