"
TinyLogger
	default ensureFileLoggerNamed: 'Casino.log'.

	self
		execute: [ metamodel := FMMetaModelBuilder metamodelFromPackages: CSNBModel packagesToProcessToCreateMetamodel , CRFModel packagesToProcessToCreateMetamodel.
			'D:\Developpement\mse\VerveineJNicolas\KitchenGWT.mse' asFileReference readStreamDo: [ :stream | gwtMooseModel := CRFModel new importFromMSEStream: stream ].
			gwtMooseModel rootFolder: 'D:\Developpement\mse\VerveineJNicolas' ]
		recordedAs: 'load Model'.

	""Generate Bl Model""
	gwtModel := CSNUICWModel new
		name: 'Showroom';
		yourself.
	gwtModel metamodel: metamodel.
	CSNMooseModelCreatorAngular
		runOn: gwtModel
		fromSourceModel: gwtMooseModel
		and: 'D:\Developpement\mse\KitchenGWT\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.


	behavioralModel := behavioralImporter resetUIAndGenerateBehavioralModel.
	behavioralImporter := CSNBehaviorModelImporterJava new
		uiModel: gwtModel;
		sourceCodeModel: gwtMooseModel;
		yourself.


	CSNModelExporterAngular export: gwtModel.

	CSNModelExporterAngularBLSpecific export: gwtModel.


	gwtModel := nil.
	gwtMooseModel := nil.

	CSNBehaviorModelGenerator generate.

	gwtMooseModel flushPrivateState.
	gwtModel flushPrivateState
"
Class {
	#name : #CSNWebModelJava,
	#superclass : #CSNJavaImporter,
	#instVars : [
		'xml',
		'xmlUiLink',
		'modelWidgetCache',
		'xmlUiWidgetLink',
		'customWidgetClassDictionnary'
	],
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #adding }
CSNWebModelJava >> addLinkForAbstractTabPhase [
	self linkForAbstractTabPhase
		do: [ :assoc | 
			(self getPhaseFromClass: assoc key)
				do: [ :phase | 
					(self getPageMetierFromClass: assoc value)
						do: [ :pageMetier | phase addBusinessPage: pageMetier ] ] ]
		displayingProgress: [ :assoc | 'compute ' , assoc name ]
		every: 1000
]

{ #category : #adding }
CSNWebModelJava >> addLinkPageMetierToPageMetier [
	self linkPageMetierToPageMetier
		do: [ :assoc | assoc key do: [ :businessPage | assoc value do: [ :widget | businessPage addWidget: widget ] ] ]
]

{ #category : #adding }
CSNWebModelJava >> addLinkPhaseToPageMetier [
	(self computeAllConstructorsLink
		collect: [ :a | (self getPhaseFromClass: a key) -> (self getPageMetierFromClass: a value) ]
		thenSelect: [ :a | a key isNotNil and: [ a value isNotNil ] ])
		do: [ :assoc | 
			assoc key
				do: [ :page | assoc value do: [ :businessPage | page addBusinessPage: businessPage ] ] ]
]

{ #category : #adding }
CSNWebModelJava >> addLinkXmlUi [

	xmlUiLink := CSNMultiValueDictionary newFrom: self linkXmlUiPhaseAndPageMetier.
	xmlUiWidgetLink := (CSNMultiValueDictionary newFrom: self linkXmlUiWidget)
		                   addAllMulti: xmlUiLink;
		                   yourself
]

{ #category : #adding }
CSNWebModelJava >> addPPPToWidget [

	| col |
	col := (self model allCSNWidgetExceptPage select: [ :widget | 
		        widget parents isEmpty ]) asOrderedCollection.
	col withIndexDo: [ :widget :index | 
		| founds |
		founds := self
			          widgetOwnerCase1: widget source source
			          maxLevel: 15
			          level: 0.
		founds do: [ :found | 
			(found isKindOf: CSNBusinessPage) ifTrue: [ " found addWidget: widget"
				self addWidgetVisitor
					addWidget: widget
					to: found
					withInvocationOfAdd: nil
					usingFactory: self factory ] ].
		index \\ 200 = 0 ifTrue: [ 
			((index / col size) asFloat * 100) record ] ]
]

{ #category : #adding }
CSNWebModelJava >> addWidgetAttributes [

	(self model allCSNWidgetExceptPage select: [ :widget | 
		 widget variable isNotNil and: [ widget variable isNotFound not ] ]) 
		do: [ :widget | 
			widget variable receivingInvocations do: [ :invoc | 
				invoc signature = 'getFlexCellFormatter()'
					ifTrue: [ 
						invoc affectation
							ifNotNil: [ :variableWithFlexCellFormater | 
								| variable |
								variable := variableWithFlexCellFormater isAccess
									            ifTrue: [ variableWithFlexCellFormater variable ]
									            ifFalse: [ variableWithFlexCellFormater ].
								variable receivingInvocations do: [ :invocOnFlexCellVariable | 
									invocOnFlexCellVariable parameters size >= 2 ifTrue: [ 
										self factory
											createAttributeFrom: invocOnFlexCellVariable
											forCellOf: widget ] ] ]
							ifNil: [ 
								(invoc previous isNotNil and: [ 
									 invoc previous receiver
										 ifNotNil: [ :receiver | receiver isImplicitVariable not ]
										 ifNil: [ true ] ]) ifTrue: [ 
									self factory
										createAttributeFrom: invoc previous
										forCellOf: widget ] ] ]
					ifFalse: [ self factory createAttributeFor: widget from: invoc ] ] ]
]

{ #category : #adding }
CSNWebModelJava >> addWidgetDefaultAttributes [
	self model allCSNWidgetExceptPage do: #addDefaultAttribute displayingProgress: [ :widget | 'DefaultAttribute for ' , widget asString ] every: 1000
]

{ #category : #adding }
CSNWebModelJava >> addWidgetsActions [
	self sourceModel allClasses
		detect: [ :c | #'com::google::gwt::event::shared::EventHandler' = c mooseName ]
		ifFound: [ :eventHandlerClass | 
			eventHandlerClass subclassHierarchy
				select: [ :class | self isElementFromApplication: class ]
				thenDo: [ :class |
					(self tryGetWidgetFromUsages: class allUsages)
						ifNotNil: [ :found | self factory createActionFromClass: class for: found ]
						ifNil: [ ('no widget found for ' , class asString) record ] ] ]
]

{ #category : #accessing }
CSNWebModelJava >> applicationSource [
	"name of the directory with the GWT application"
	^  'BLCoreIncubatorGwt'
]

{ #category : #'private - accessing' }
CSNWebModelJava >> buisinessPageWithSources [
	"I extract this method for optimisations purpose"

	^ self model
		cacheAt: #buisinessPageWithSources
		ifAbsentPut: [ self model allCSNPageMetier
				reject: [ :businessPage | businessPage sources isEmpty ] ]
]

{ #category : #'private - postImport' }
CSNWebModelJava >> cleanImportCache [
	self model removeCache: #buisinessPageWithSources
]

{ #category : #adding }
CSNWebModelJava >> computeAllConstructorsLink [
	^ self sourceModel constructors
		flatCollect: [ :method | 
			| got |
			got := (method queryAll: #in) atScope: FamixTClass.
			got collect: [ :p | p -> method parentType ] ]
]

{ #category : #initialization }
CSNWebModelJava >> createFactory [
	factory := CSNWidgetFactoryAngular new
		model: model;
		importer: self;
		addVisitorImporter: CSNModelImporterCoreWebVisitor new;
		yourself
]

{ #category : #'private - accessing' }
CSNWebModelJava >> customWidgetClassDictionnary [
	^ customWidgetClassDictionnary
		ifNil: [ customWidgetClassDictionnary := (CSNMultiValueDictionary
				newFrom:
				((self model allWithType: CSNUICustomWidget)
				reject: [ :widget | widget source isClass ]
				thenCollect:
					[ :custom | (custom source target first atScope: FamixTClass) anyOne -> custom ]))
				removeKey: nil ifAbsent: [  ];
				yourself ]
]

{ #category : #adding }
CSNWebModelJava >> domBuildingMethods [
	"setWidgetDetail and setListe are for the ListAndDetails"

	^ {'setWidget(' . 'setWidgets('. 'add(' . 'setRecto(' . 'setListe' . 'setWidgetDetail'.
	'initWidget('}
]

{ #category : #'private - actions' }
CSNWebModelJava >> generateActionAppel [
	self linkFromWidgetActionAppel
		do: [ :el | 
			| action |
			action := (self factory create: CSNActionAppel).
			el key addAction: action.
			el value ifNotNil: [ action call: el value ] ]
]

{ #category : #'private - actions' }
CSNWebModelJava >> generatePageMetier [

	(sourceModel allWithSubTypesOf: FamixJavaType) asSet
		detect: [ :class | class name = #IPageMetier ]
		ifFound: [ :iPageMetierInterface | 
			((iPageMetierInterface isKindOf: FamixJavaInterface)
				 ifTrue: [ 
					 (iPageMetierInterface implementations collect: [ :a | 
						  a implementingClass subclassHierarchy ]) flattened ]
				 ifFalse: [ "iPageMetierInterface is probable a class like in Moose9" 
					 iPageMetierInterface subclassHierarchy ])
				reject: [ :class | 
				class isStub or: [ class name endsWith: 'XMLUi' ] ]
				thenDo: [ :aPageMetier | 
					self factory createBusinessPageFromFAMIXClass: aPageMetier ] ]
		ifNone: [ 
		Exception signal: 'No IPageMetier abstract interface found' ]
]

{ #category : #'private - actions' }
CSNWebModelJava >> generatePhase [

	xml allNodesDo: [ :aXmlNode | (aXmlNode isElement and: [ aXmlNode name = 'phase' ]) ifTrue: [ self factory createPageFromXMLElement: aXmlNode ] ]
]

{ #category : #'private - actions' }
CSNWebModelJava >> generateService [

	| uc createdServices |
	"BVER 20/05/2022 ! I should take the subclass of the interface for the method parameter names ""interfaceService := self sourceModel allModelClasses asSet select: [ 
		                    :e | 
		                    (e superclassHierarchy anySatisfy: [ :a | 
			                     #( 'RestService' 'RemoteService' ) includes:
				                     a name ]) and: [ e isInterface not ] ].
	interfaceService addAll: ((interfaceService flatCollect: [ :class | 
			  class classes flatCollect: #attributes ]) collect: #declaredType)."
	uc := self sourceModel allModelClasses select: [ :class | 
		      (class name beginsWith: 'Uc') and: [ 
			      (class name endsWith: 'Test') not ] ].
	createdServices := uc
		                   reject: [ :service | 
		                   service name endsWith: 'Async' ]
		                   thenCollect: [ :aServiceClass | 
			                   self factory createServiceFromServiceClass:
				                   aServiceClass ].

	createdServices do: [ :service | 
		createdServices
			detect: [ :owner | 
				owner source = ((service source superclass isKindOf: FamixJavaParameterizedType)
					 ifTrue: [ service source superclass parameterizableClass ]
					 ifFalse: [ service source superclass ]) ]
			ifFound: [ :owner | owner addChildService: service ]
			ifNone: [ "no parent" ] ].
	^ createdServices
]

{ #category : #'private - actions' }
CSNWebModelJava >> generateServiceAPIParameter [
	(self model allWithSubTypesOf: CSNServiceAPI)
		withIndexDo: [ :e :index | 
			e source parameters
				do: [ :parameter | 
					e
						addParameter:
							((self factory create: CSNServiceAPIParameter fromSource: parameter)
								name: parameter name;
								yourself) ].
			index \\ 100 = 0 ifTrue: [ ((index / self model allCSNServiceAPI size) asFloat * 100) record ] ]
]

{ #category : #'private - actions' }
CSNWebModelJava >> generateServiceAction [
	self model allCSNService
		withIndexDo: [ :e :index | 
			self model addAll: (e addAllActions: (self getListOfServiceActionForServiceClass: e source)).
			index \\ 10 = 0 ifTrue: [ ((index / self model allCSNService size) asFloat * 100) record ] ]
]

{ #category : #'private - actions' }
CSNWebModelJava >> generateWidget [

	| col |
	col := self widgetConstructorsInvocation
	       , self widgetAnonymousSubclasses
	       , self widgetFactoryInvocation reject: [ :invocationOrClass | 
		       (invocationOrClass source mooseName beginsWithAnyOf:
			        self widgetNamespaces) or: [ 
			       (invocationOrClass asString includesSubstring:
				        'noname#super') or: [ 
				       (invocationOrClass asString includesSubstring:
					        'noname#this') or: [ self isInFactory: invocationOrClass ] ] ] ].
	col asOrderedCollection withIndexDo: [ :invocation :index | 
		| blWidget |
		blWidget := self factoryCreateWidgetFrom: invocation.
		blWidget affectedActions: invocation affectation.
		(blWidget affectedActions isNotNil and: [ 
			 blWidget affectedActions isNotFound not and: [ 
				 blWidget affectedActions isInvocation not ] ]) ifTrue: [ 
			blWidget name: blWidget affectedActions name ].
		index \\ 200 = 0 ifTrue: [ 
			((index / col size) asFloat * 100) record ] ]
]

{ #category : #adding }
CSNWebModelJava >> generateWidgetsLink [

	| widgets |
	widgets := (self model allWithSubTypesOf: CSNContainer) iterator
	           | [ :containers | 
		           (containers isKindOf: CSNBusinessPage) or: [ 
			           containers isKindOf: CSNPage ] ] rejectIt > Array.
	widgets withIndexDo: [ :widget :index | 
		self computeChildrenOf: widget.
		index \\ 200 = 0 ifTrue: [ 
			((index / widgets size) asFloat * 100) record ] ]
]

{ #category : #accessing }
CSNWebModelJava >> getClassNamed: aClassName [
	^ self sourceModel allModelClasses
		detect: [ :a | a mooseName = aClassName ]
]

{ #category : #accessing }
CSNWebModelJava >> getCustomWidgetFromClass: aClass [
	^ self customWidgetClassDictionnary at: aClass ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNWebModelJava >> getFromSource: listofSourcedElement forClass: aClass [

	^ (xmlUiLink at: aClass ifAbsent: [ ^ (listofSourcedElement select: [ :a | a source = aClass ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | { (a at: 1) } ] ]) 
		  collect: [ :class | (listofSourcedElement select: [ :a | a source = class ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | a at: 1 ] ]
]

{ #category : #'private - actions' }
CSNWebModelJava >> getListOfEndpointForServiceClass: aServiceClass [

	^ aServiceClass methods reject: [ :method | 
		  method isConstructor or: [ 
			  method sourceAnchor isNil or: [ 
				  method sourceAnchor hasSource not "sourceText isEmpty" "reject method from src/target/... In source" ] ] ]
]

{ #category : #accessing }
CSNWebModelJava >> getListOfServiceActionForServiceClass: aServiceClass [

	^ (self getListOfEndpointForServiceClass: aServiceClass) collect: [ 
		  :method | CSNServiceAPI newFor: method ] "sourceText isEmpty" "reject method from src/target/... In source"
]

{ #category : #accessing }
CSNWebModelJava >> getPageMetierFromClass: aClass [
	^ self getFromSource: self buisinessPageWithSources forClass: aClass
]

{ #category : #private }
CSNWebModelJava >> getPhaseCallInvocations [

	^ (((Smalltalk includesKey: #FamixJavaInterface)
		    ifTrue: [ self sourceModel allWithType: FamixJavaInterface ]
		    ifFalse: [ self sourceModel allWithType: FamixJavaClass ])
		   detect: [ :a | a mooseName endsWith: 'ConstantsPhase' ]
		   ifNone: [ self error: 'No call invocation strategy' ]) methods 
		  flatCollect: #incomingInvocations
]

{ #category : #accessing }
CSNWebModelJava >> getPhaseFromClass: aClass [
	^ self getFromSource: self model allCSNPage forClass: aClass
]

{ #category : #private }
CSNWebModelJava >> getPhaseNamed: aCodePhase [
	^ self model allCSNPage detect: [ :e | e codePhase = aCodePhase ] ifNone: [ nil ]
]

{ #category : #'private - adding' }
CSNWebModelJava >> getWidgetContainerOfWidgetWithoutAffectation: widget [

	| containerInvocation found |
	containerInvocation := widget source isType
		                       ifTrue: [ 
			                       widget source typeContainer isInitializer
				                       ifTrue: [ widget source ]
				                       ifFalse: [ (widget source typeContainer atScope: FamixTClass) anyOne incomingInstanciations anyOne ] ]
		                       ifFalse: [ 
			                       widget source isReturned
				                       ifTrue: [ 
					                       widget source sender allUsages
						                       ifNotEmpty: [ :col | col anyOne ]
						                       ifEmpty: [ nil ] ]
				                       ifFalse: [ widget source container ] ].
	[ containerInvocation isNotNil ] whileTrue: [ 
		found := (self widgetInVariable: containerInvocation affectation) 
			         ifNil: [ 
			         self widgetInVariable: containerInvocation receiver ].
		found
			ifNotNil: [ 
				^ { 
					  found.
					  containerInvocation } ]
			ifNil: [ containerInvocation := containerInvocation container ] ].
	^ nil
]

{ #category : #accessing }
CSNWebModelJava >> gwtWidgetNamespace [
	^ 'com::google::gwt::user::client::ui'
]

{ #category : #api }
CSNWebModelJava >> import [

	self execute: [ self generatePhase ] recordedAs: '1/15 generatePhase'.
	self
		execute: [ self generatePageMetier ]
		recordedAs: '2/15 generatePageMetier'.
	self execute: [ self addLinkXmlUi ] recordedAs: '3/15 addLinkXmlUi'.
	self
		execute: [ self addLinkForAbstractTabPhase ]
		recordedAs: '4/15 addLinkForAbstractTabPhase'.
	self
		execute: [ self addLinkPhaseToPageMetier ]
		recordedAs: '5/15 addLinkPhaseToPageMetier'.
	self
		execute: [ self addLinkPageMetierToPageMetier ]
		recordedAs: '6/15 addLinkPageMetierToPageMetier'.
	self
		execute: [ self generateWidget ]
		recordedAs: '7/15 generateWidget'.
	"keep this order for the widget adding. The second one depends on the first one.... Maybe i should create one method 'generate widgetlink'"
	self
		execute: [ self generateWidgetsLink ]
		recordedAs: '8/15 generateWidgetsLink'.
	self
		execute: [ self addPPPToWidget ]
		recordedAs: '9/15 addPPPToWidget'.
	self
		execute: [ self generateActionAppel ]
		recordedAs: '10/15 generateBLActionAppel'.
	self
		execute: [ self generateService ]
		recordedAs: '11/15 generateService'.
	self
		execute: [ self generateServiceAction ]
		recordedAs: '12/15 generateServiceAction'.
	self
		execute: [ self generateServiceAPIParameter ]
		recordedAs: '12/15 generateServiceAPIParameter'.
	"this last two should stay at the end"
	self
		execute: [ self addWidgetAttributes ]
		recordedAs: '13/15 addWidgetAttributes'.
	self
		execute: [ self addWidgetsActions ]
		recordedAs: '14/15 addWidgetsActions'.
	self
		execute: [ self addWidgetDefaultAttributes ]
		recordedAs: '15/15 addWidgetDefaultAttributes'
]

{ #category : #accessing }
CSNWebModelJava >> initialize [
	super initialize.
	possibleAddInvocationVisitorClass := CSNCoreWebPossibleAddInvocationVisitor
]

{ #category : #accessing }
CSNWebModelJava >> isElementFromApplication: e [
	^ e hasSourceAnchor and: [ e sourceAnchor fileName includesSubstring: self applicationSource ]
]

{ #category : #'private - actions' }
CSNWebModelJava >> isInFactory: invocationOrClass [
	"used in PostOffice cause some factory are defined inside the PostOffice application \ie createBLLinkLabel"
	^ false
]

{ #category : #accessing }
CSNWebModelJava >> isWidgetFromApplication: e [
	^ (self isElementFromApplication: e)
		and: [ (e name endsWith: 'Ui') not
				and: [ ((self model allCSNPage , self model allCSNPageMetier
						collect: #source) includes: e) not ] ]
]

{ #category : #private }
CSNWebModelJava >> linkForAbstractTabPhase [
	^ (self modelPhases 
		select: [ :a | 
			(a withSuperclassHierarchy collect: #name)
				anySatisfy: [ :name | 'AbstractTabPhaseController' = name ] ]
		thenCollect: [ :class | 
			class withSuperclassHierarchy
				collect: [ :c | 
					((c queryLocalOutgoing: FamixTInvocation)
						reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
						thenCollect: [ :invoc | invoc candidates at: 1 ])
						select: [ :e | e isConstructor and: [ self modelPageMetier includes: e parentType ] ]
						thenCollect: [ :e | class -> e parentType ] ] ]) flattened
]

{ #category : #private }
CSNWebModelJava >> linkFromWidgetActionAppel [
	^ self getPhaseCallInvocations
		collect: [ :el | 
			| widget |
			widget := self linkFromWidgetActionAppelCase1: el.
			"link ifNil: [ link := self linkFromWidgetActionAppelCase2: el ]."
			widget -> (self searchCalledPhaseFromInvocation: el) ]
		thenSelect: [ :a | a key isNotNil and: [ a value isNotNil ] ]
]

{ #category : #private }
CSNWebModelJava >> linkFromWidgetActionAppelCase1: anInvocation [
	"Return the found association
	case 1 and 4
	new Widget ( new blabla ( new bleble ( CP)))"

	| found |
	found := self searchWidgetFromConstructorInvocation: anInvocation.
	found
		ifNotNil: [ ^ found ]
		ifNil: [ | elContainer |
			elContainer := anInvocation container.
			^ elContainer ifNotNil: [ self linkFromWidgetActionAppelCase1: elContainer ] ]
]

{ #category : #private }
CSNWebModelJava >> linkFromWidgetActionAppelCase2: anInvocation [

	"Return the found association
	case 2
	var i = new Widget ()
	i.addHandler..(BlBl)"

	anInvocation source parentType isHandlerClass ifFalse: [ ^ nil ].
	(self widgetInVariable: (anInvocation source parentType typeContainer outgoingInvocations
			  detect: [ :invoc | 
				  invoc sourceAnchor isNotNil and: [ 
					  invoc sourceAnchor startPos < anInvocation sourceAnchor startPos and: [ invoc sourceAnchor endPos > anInvocation sourceAnchor endPos ] ] ]
			  ifNone: [ ^ nil ]) receiver)
		ifNotNil: [ :widgetContainer | ^ widgetContainer -> (self searchCalledPhaseFromInvocation: anInvocation) ]
		ifNil: [ ^ nil ]
]

{ #category : #private }
CSNWebModelJava >> linkPageMetierToPageMetier [
	^ ((self model allCSNPageMetier collect: #source) , xmlUiLink keys
		flatCollect: [ :pageMetier | 
			pageMetier incomingInstanciations
				reject: [ :invoc | invoc signature matchesRegex: '.*this\(.*|.*super\(.*' ]
				thenCollect: [ :invoc | 
					((self getPageMetierFromClass: (invoc target at: 1) parentType) at: 1) affectedActions: (invoc affectation ifNil: [ invoc ]).
					(self getPageMetierFromClass: invoc source parentType) -> (self getPageMetierFromClass: (invoc target at: 1) parentType) ] ])
		select: [ :assoc | assoc key isNotNil ]
]

{ #category : #private }
CSNWebModelJava >> linkXmlUiPhaseAndPageMetier [

	^ (self modelPhases , self modelPageMetier) asSet
		  select: [ :a | a superclass mooseName endsWith: 'Ui' ]
		  thenCollect: [ :a | a superclass -> a ]
]

{ #category : #adding }
CSNWebModelJava >> linkXmlUiWidget [

	^ self modelWidget flatCollect: [ :widget | 
		  widget superclassHierarchy
			  select: [ :class | (self isElementFromApplication: class) or: [ class mooseName endsWith: 'Ui' ] ]
			  thenCollect: [ :class | class -> widget ] ]
]

{ #category : #'private - accessing' }
CSNWebModelJava >> modelPageMetier [
	^ self model allCSNPageMetier collect: #source
]

{ #category : #'private - accessing' }
CSNWebModelJava >> modelPhases [
	"support the C/S Phase (see application RH)"
	^ self model allCSNPage collect: #source thenReject: #isNil 
]

{ #category : #'private - accessing' }
CSNWebModelJava >> modelWidget [

	^ modelWidgetCache ifNil: [ 
		  modelWidgetCache := self sourceModel allClasses select: [ :e | 
			                      (e superclassHierarchy anySatisfy: [ :a | a name = 'Widget' ]) and: [ 
				                      (e typeContainer mooseName beginsWithAnyOf: self widgetNamespaces) or: [ 
					                      (e typeContainer mooseName beginsWith: self gwtWidgetNamespace) or: [ self isWidgetFromApplication: e ] ] ] ] ]
]

{ #category : #api }
CSNWebModelJava >> postImport [
	| currentStep maxStep |
	currentStep := 0.
	maxStep := 3.
	'PostImport'
		displayProgressFrom: 0
		to: maxStep
		during: [ :bar | 
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' for widgets'.
			self model allCSNWidget do: #postImport displayingProgress: [:wid | 'post import widgets : ', wid name asString ].
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' for layouts'.
			self model allCSNLayout do: #postImport displayingProgress: [:wid | 'post import layout : ', wid name asString ].
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' for pages'.
			self model allCSNPage do: #postImport displayingProgress: [:wid | 'post import page : ', wid name asString ].
	].

	self cleanImportCache
	
]

{ #category : #private }
CSNWebModelJava >> searchCalledPhase: aSignature [
	^  self getPhaseNamed: (aSignature removeSuffix: '()')
]

{ #category : #private }
CSNWebModelJava >> searchCalledPhaseFromInvocation: invoc [
	^ self searchCalledPhase: invoc target first signature
]

{ #category : #private }
CSNWebModelJava >> searchWidgetFromConstructorInvocation: anInvocation [
	^ self model allCSNWidget detect: [ :widget | widget sources isNotEmpty and: [ widget source = anInvocation ] ] ifNone: [ nil ]
]

{ #category : #adding }
CSNWebModelJava >> tryGetWidgetFromUsages: usages [
	| widget |
	usages
		detect: [ :usage | (widget := (self linkFromWidgetActionAppelCase1: usage)) isNotNil ]
		ifFound: [ :found | ^ widget ]
		ifNone: [ (usages collect: #receiver) do: [ :receiver | (self widgetInVariable: receiver) ifNotNil: [ :found | ^ found ] ] ].
	^ nil
]

{ #category : #accessing }
CSNWebModelJava >> widgetAnonymousSubclasses [
	^ ((self modelWidget flatCollect: [ :widget | widget withSubclassHierarchy ]) select: #isAnonymousClass)
]

{ #category : #accessing }
CSNWebModelJava >> widgetConstructorsInvocation [

	"Get the constructor and try to determine the stub constructor"

	^ (self modelWidget collect: [ :widget | 
		   widget methods
			   select: #isConstructor
			   thenCollect: #incomingInvocations ]) flattened asSet reject: [ 
		  :invoc | 
			"I reject the BLLabel that will be added in ComponentUtils
			Stuff like `ComponentUtils.getLibelleItem(new BLLabel(""Blabla""));`			
"
		  (invoc signature beginsWith: 'BLLabel') and: [ 
			  invoc container isNotNil and: [ 
				  invoc container signature beginsWith: 'getLibelleItem' ] ] ]
]

{ #category : #accessing }
CSNWebModelJava >> widgetFactoryInvocation [
	^ (((self sourceModel allModelClasses
		select: [ :a | #(#FactoryBLLabel #ComponentUtils) includes: a name ])
		flatCollect: #methods)
		select: [ :m | m name = 'create' or: [ m name beginsWith: 'getLibelleItem'] ]
		thenCollect: #incomingInvocations) flatten
]

{ #category : #accessing }
CSNWebModelJava >> widgetInVariable: aVariable [
	"First check if the variable is the variable for a widget.
	If not check at the type level.
THIS CANNOT BE IN THE OTHER WAY"
	aVariable ifNil: [ ^ nil ].
	^ self model allCSNWidget
		  detect: [ :el | el variable = aVariable ]
		  ifNone: [ 
			  self model allCSNWidget
				  detect: [ :el | 
					  aVariable name ~= 'content' and: [ 
						  (aVariable atScope: FamixTType) anyOne = el realClass ] ]
				  ifNone: [ nil ] ]
]

{ #category : #accessing }
CSNWebModelJava >> widgetNamespaces [

	^ { 'fr::bl::client::core::refui'. 'fr::bl::client::core::tasks'. 'fr::bl::client::core::phasecontrol::impl'. 'fr::bl::client::sedit::refui' }
]

{ #category : #accessing }
CSNWebModelJava >> widgetOwnerCase1: invocation maxLevel: maxLevel level: level [
	| found |
	level = maxLevel ifTrue: [ ^ {} ].
	(invocation isNil or: [ invocation isOfType: FamixTPackage ]) ifTrue: [ ^ {} ].
	invocation isClass
		ifFalse: [ (invocation atScope: FamixTClass) ifEmpty: [ ^ {} ].
			^ self widgetOwnerCase1: (invocation atScope: FamixTClass) anyOneIfOnlyOneElement maxLevel: maxLevel level: level + 1 ]
		ifTrue: [ found := self getPhaseFromClass: invocation.
			found
				ifNotNil: [ ^ found ]
				ifNil: [ found := self getPageMetierFromClass: invocation.
					found
						ifNotNil: [ ^ found ]
						ifNil: [ found := self getCustomWidgetFromClass: invocation.
							found ifNotNil: [ ^ found ].
							invocation incomingReferences
								ifNotEmpty: [ :references | ^ self widgetOwnerCase1: (references at: 1) source belongsTo maxLevel: maxLevel level: level + 1 ] ] ] ].
	^ self widgetOwnerCase1: invocation maxLevel: maxLevel level: level + 1
]

{ #category : #accessing }
CSNWebModelJava >> xml [
	^ xml
]

{ #category : #accessing }
CSNWebModelJava >> xml: anObject [
	xml := anObject
]

{ #category : #accessing }
CSNWebModelJava >> xmlUiLink [

	^ xmlUiLink
]

{ #category : #accessing }
CSNWebModelJava >> xmlUiLink: anObject [

	xmlUiLink := anObject
]

{ #category : #accessing }
CSNWebModelJava >> xmlUiWidgetLink [

	^ xmlUiWidgetLink
]

{ #category : #accessing }
CSNWebModelJava >> xmlUiWidgetLink: anObject [

	xmlUiWidgetLink := anObject
]
