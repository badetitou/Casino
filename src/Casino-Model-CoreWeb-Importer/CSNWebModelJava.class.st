"
""Generate BlApp""
gwtMooseModel := FAMIXMooseModel new importFromMSEStream:  'D:\Developpement\mse\VerveineJNicolas\KitchenGWT.mse' asFileReference readStream.
gwtMooseModel rootFolder: 'D:\Developpement\mse\VerveineJNicolas'. 

""Generate Bl Model""
gwtModel := CSNUIMooseModel new name: 'Showroom'; yourself.
CSNMooseModelCreatorAngular runOn: gwtModel fromSourceModel: gwtMooseModel and: 'D:\Developpement\mse\KitchenGWT\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.

CSNModelExporterAngular export: gwtModel.
"
Class {
	#name : #CSNWebModelJava,
	#superclass : #CSNWebModel,
	#instVars : [
		'xml',
		'xmlUiLink',
		'modelWidgetCache',
		'xmlUiWidgetLink'
	],
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #adding }
CSNWebModelJava >> addLinkBetweenWidgets [
	| responsabilityHandlerForUsages |
	responsabilityHandlerForUsages := CSNLinkWidgetResponsabilitiesReceiverHandler new.
	(self model allCSNWidgetExceptPage reject: [ :widget | widget widgetContainer isNotNil ])
		do: [ :widget |
			 self addParentTo: widget withHandlerForUsages: responsabilityHandlerForUsages ]
		displayingProgress: [ :widget | 'compute ' , widget class name ]
		every: 1000
]

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
	xmlUiWidgetLink := (CSNMultiValueDictionary newFrom: self linkXmlUiWidget) addAllMulti:  xmlUiLink; yourself.
]

{ #category : #adding }
CSNWebModelJava >> addOnClickAttribute [
	((self sourceModel allClasses select: [ :c | 'ClickHandler' = c name ]) at: 1) subclassHierarchy
		select: [ :class | self isElementFromApplication: class ]
		thenDo: [ :class | 
			(class allUsages collect: #receiver)
				do: [ :receiver | (self widgetInVariable: receiver) ifNotNil: [ :found | self factory createActionFromClass: class for: found ] ] ]
]

{ #category : #adding }
CSNWebModelJava >> addPPPToWidget [
	self model allCSNWidgetExceptPage select: [:widget | widget parents isEmpty ]
		thenDo: [ :widget | 
			| founds |
			founds := self widgetOwnerCase1: widget source from maxLevel: 15 level: 0.
			founds do: [ :found | found addWidget: widget ] ]
]

{ #category : #adding }
CSNWebModelJava >> addParentTo: widget withHandlerForUsages: responsabilityHandlerForUsages [
  ^ widget affectedActions ifNotNil: [ | usages |
        usages := widget affectedActions allUsages , (widget affectedActions allUsages flatCollect: [:el |  el allContainers ]) reject: [:el |  (el receiver isNotNil and: [ el receiver name includesSubstring: 'content' ]) or: [ (el signature beginsWithAnyOf: {'setWidget(' . 
                          'add(' . 
                          'setRecto('}) not ] ].
        responsabilityHandlerForUsages handleAddLinkedFromVariable: usages asOrderedCollection to: widget withXmlui: xmlUiWidgetLink andImporter: self ] ifNil: [ | containerInvocation |
        containerInvocation := widget source container.
        [ containerInvocation isNotNil ] whileTrue: [ | found |
              found := self widgetInVariable: containerInvocation receiver.
              found ifNotNil: [ found addWidget: widget withInvocationOfAdd: containerInvocation usingFactory: self factory.
                    containerInvocation := nil ] ifNil: [ containerInvocation := containerInvocation container ] ] ]
]

{ #category : #adding }
CSNWebModelJava >> addWidgetAttributes [
	(self model allCSNWidgetExceptPage select: [ :widget | widget variable isNotNil ])
		do: [ :widget | 
			widget variable receivingInvocations
				do: [ :invoc | 
					invoc signature = 'getFlexCellFormatter()'
						ifTrue: [ invoc affectation
								ifNotNil:
									[ :variableWithFlexCellFormater | 
										| variable |
										variable := variableWithFlexCellFormater isAccess ifTrue: [ variableWithFlexCellFormater variable ] ifFalse: [ variableWithFlexCellFormater ].
									 variable receivingInvocations do: [ :invocOnFlexCellVariable |
											(invocOnFlexCellVariable parameters size >= 2) ifTrue: [ self factory createAttributeFrom: invocOnFlexCellVariable forCellOf: widget ] ] ]
								ifNil: [ (invoc previous isNotNil and: [ invoc previous receiver ifNotNil: [ :receiver | receiver isImplicitVariable not ] ifNil: [ true ] ])
										ifTrue: [ self factory createAttributeFrom: invoc previous forCellOf: widget ] ] ]
						ifFalse: [ self factory createAttributeFor: widget from: invoc ] ] ]
		displayingProgress: [ :widget | 'compute attribute of ' , widget asString ]
		every: 1000
]

{ #category : #adding }
CSNWebModelJava >> addWidgetDefaultAttributes [
	self model allCSNWidgetExceptPage do: #addDefaultAttribute displayingProgress: [ :widget | 'DefaultAttribute for ' , widget asString ] every: 1000
]

{ #category : #accessing }
CSNWebModelJava >> applicationSource [
	"name of the directory with the GWT application"
	^  'BLCoreIncubatorGwt'
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

{ #category : #'private-actions' }
CSNWebModelJava >> generateBLActionAppel [
	self linkFromWidgetActionAppel
		do: [ :el | 
			| action |
			action := (self factory create: CSNActionAppel).
			el key addAction: action.
			el value ifNotNil: [ action call: el value ] ]
]

{ #category : #'private-actions' }
CSNWebModelJava >> generatePageMetier [
	sourceModel allModelClasses
		select: [ :e | (e superclassHierarchy anySatisfy: [ :a | a name = 'IPageMetier' ]) and: [ ('*XMLUi' match: e name) not ] ]
		thenDo: [ :aPageMetier | self factory createBusinessPageFromFAMIXClass: aPageMetier ]
]

{ #category : #'private-actions' }
CSNWebModelJava >> generatePhase [
	xml
		nodesDo: [ :aXmlNode | 
			(aXmlNode isElement and: [ aXmlNode name localName = 'phase' ])
				ifTrue: [ self factory createPageFromXMLElement: aXmlNode ] ].
]

{ #category : #'private-actions' }
CSNWebModelJava >> generateService [
	| interfaceService |
	interfaceService := self sourceModel allTypes
		select: [ :e | (e superclassHierarchy anySatisfy: [ :a | a name = 'RemoteService' ]) and: [ e isInterface ] ].
	interfaceService addAll: ((interfaceService flatCollect: [ :class | class classes flatCollect: #attributes ]) collect: #declaredType).
	interfaceService do: [ :aServiceClass | self factory createServiceFromServiceClass: aServiceClass ]
]

{ #category : #'private-actions' }
CSNWebModelJava >> generateServiceAction [
	self model allCSNService
		do: [ :e | self model silentlyAddAll: (e addAllActions: (self getListOfServiceActionForServiceClass: e source)) ]
		displayingProgress: [ :e | 'compute ' , e asString ]
		every: 1000
]

{ #category : #'private-actions' }
CSNWebModelJava >> generateWidget [
	(self widgetConstructorsInvocation , self widgetAnonymousSubclasses , self widgetFactoryInvocation
		reject: [ :invocationOrClass | 
			(invocationOrClass from mooseName beginsWithAnyOf: self widgetNamespaces)
				or: [ (invocationOrClass asString includesSubstring: 'noname#super')
						or: [ (invocationOrClass asString includesSubstring: 'noname#this') or: [ self isInFactory: invocationOrClass ] ] ] ])
		do: [ :invocation | 
			| blWidget |
			blWidget := self factoryCreateWidgetFrom: invocation.
			blWidget affectedActions: invocation affectation.
			(blWidget affectedActions isNotNil and: [ blWidget affectedActions isInvocation not ]) ifTrue: [ blWidget name: blWidget affectedActions name ] ]
		displayingProgress: [ :invoc | 'Generate widget : ' , invoc asString ]
		every: 100
]

{ #category : #accessing }
CSNWebModelJava >> getClassNamed: aClassName [
	^ (self sourceModel allModelClasses select: [ :a | a mooseName = aClassName ]) at: 1
]

{ #category : #accessing }
CSNWebModelJava >> getCustomWidgetFromClass: aClass [
	^ ((self model allWithType: CSNUICustomWidget) reject: [ :widget | widget source isClass ])
		detect: [ :custom | (custom source to first atScope: FamixTClass) anyOne = aClass ]
		ifFound: [ :founded | {founded} "need to return a collection to follow the other getPage and getBusinessPage"]
		ifNone: [ nil ]
]

{ #category : #accessing }
CSNWebModelJava >> getFromSource: listofSourcedElement forClass: aClass [
	^ (xmlUiLink at: aClass ifAbsent: [ ^ (listofSourcedElement select: [ :a | a source = aClass ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | {(a at: 1)} ] ])
		collect: [ :class | (listofSourcedElement select: [ :a | a source = class ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | a at: 1 ] ]
]

{ #category : #accessing }
CSNWebModelJava >> getListOfServiceActionForServiceClass: aServiceClass [
	"Looking for class with `aServiceClass name ', Async'` 
	
	Currently disable because we don't know why we should want NOT async method... and all the method are the same.
	So we can say that all the non async method are also all the async method (with an arg less)
	Please consider this method return all the async method"

	| listOfSubAsyncClass |
	listOfSubAsyncClass := {} "self getAsyncClassFrom: aServiceClass".
	^ (listOfSubAsyncClass flatCollect: #methods) , aServiceClass methods reject: [ :method | method sourceAnchor isNil or: [ method sourceAnchor sourceText isEmpty "reject method from src/target/... In source"] ]
		thenCollect: [ :method | CSNServiceAPI newFor: method ]
]

{ #category : #accessing }
CSNWebModelJava >> getPageMetierFromClass: aClass [
	^ self getFromSource: (self model allCSNPageMetier reject: [ :businessPage | businessPage sources isEmpty ]) forClass: aClass
]

{ #category : #private }
CSNWebModelJava >> getPhaseCallInvocations [
	^ (self sourceModel allClasses detect: [ :a | a mooseName endsWith: 'ConstantsPhase' ] ifNone: [ self error: 'No call invocation strategy' ]) methods
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

{ #category : #accessing }
CSNWebModelJava >> gwtWidgetNamespace [
	^ 'com::google::gwt::user::client::ui'
]

{ #category : #api }
CSNWebModelJava >> import [
	| currentStep maxStep |
	currentStep := 0.
	maxStep := 15.
	'prepare generatePhase'
		displayProgressFrom: 0
		to: maxStep
		during: [ :bar | 
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' generatePhase'.
			self generatePhase.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' generatePageMetier'.
			self generatePageMetier.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addLinkXmlUi'.
			self addLinkXmlUi.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addLinkForAbstractTabPhase'.
			self addLinkForAbstractTabPhase.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addLinkPhaseToPageMetier'.
			self addLinkPhaseToPageMetier.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addLinkPageMetierToPageMetier'.
			self addLinkPageMetierToPageMetier.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' generateWidget'.
			self generateWidget.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addLinkBetweenWidgets'.
			"keep this order for the widget adding. The second one depends on the first one.... Maybe i should create one method 'generate widgetlink'"
			self addLinkBetweenWidgets.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addPPPToWidget'.
			self addPPPToWidget.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' generateBLActionAppel'.
			self generateBLActionAppel.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' generateService'.
			self generateService.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' generateServiceAction'.
			self generateServiceAction.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addWidgetAttributes'.
			"this last two should stay at the end"
			currentStep := currentStep + 1.
			self addWidgetAttributes.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addOnClickAttribute'.
			self addOnClickAttribute.
			currentStep := currentStep + 1.
			bar current: currentStep.
			bar label: currentStep printString , '/' , maxStep printString , ' addWidgetDefaultAttributes'.
			self addWidgetDefaultAttributes.]
]

{ #category : #accessing }
CSNWebModelJava >> isElementFromApplication: e [
	^ e hasSourceAnchor and: [ e sourceAnchor fileName includesSubstring: self applicationSource ]
]

{ #category : #'private-actions' }
CSNWebModelJava >> isInFactory: invocationOrClass [
	"used in PostOffice cause some factory are defined inside the PostOffice application \ie createBLLinkLabel"
	^ false
]

{ #category : #accessing }
CSNWebModelJava >> isWidgetFromApplication: e [
	^ (self isElementFromApplication: e)
		and: [ (e name endsWith: 'Ui') not and: [ ((self model allCSNPage , self model allCSNPageMetier collect: #source) includes: e) not ] ]
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
			| link |
			link := self linkFromWidgetActionAppelCase1: el.
			"link ifNil: [ link := self linkFromWidgetActionAppelCase2: el ]."
			link ]
		thenSelect: #isNotNil
]

{ #category : #private }
CSNWebModelJava >> linkFromWidgetActionAppelCase1: anInvocation [
	"Return the found association
	case 1 and 4
	new Widget ( new blabla ( new bleble ( CP)))"

	| found elContainer |
	elContainer := anInvocation container.
	elContainer ifNil: [ ^ nil ].
	" case 1 "
	found := self searchWidgetFromConstructorInvocation: elContainer.
	found
		ifNotNil: [ ^ found -> (self searchCalledPhaseFromInvocation: anInvocation) ]
		ifNil: [ ^ self linkFromWidgetActionAppelCase1: elContainer ]
]

{ #category : #private }
CSNWebModelJava >> linkFromWidgetActionAppelCase2: anInvocation [
	"Return the found association
	case 2
	var i = new Widget ()
	i.addHandler..(BlBl)"

	anInvocation from parentType isHandlerClass ifFalse: [ ^ nil ].
	(self
		widgetInVariable:
			(anInvocation from parentType container outgoingInvocations
				detect: [ :invoc | 
					invoc sourceAnchor isNotNil
						and: [ invoc sourceAnchor startPos < anInvocation sourceAnchor startPos and: [ invoc sourceAnchor endPos > anInvocation sourceAnchor endPos ] ] ]
				ifNone: [ ^ nil ]) receiver) ifNotNil: [ :widgetContainer | ^ widgetContainer -> (self searchCalledPhaseFromInvocation: anInvocation) ] ifNil: [ ^ nil ]
]

{ #category : #private }
CSNWebModelJava >> linkPageMetierToPageMetier [
	^ ((self model allCSNPageMetier collect: #source) , xmlUiLink keys
		flatCollect: [ :pageMetier | 
			pageMetier incomingInstanciations
				reject: [ :invoc | invoc signature matchesRegex: '.*this\(.*|.*super\(.*' ]
				thenCollect: [ :invoc | 
					((self getPageMetierFromClass: (invoc to at: 1) parentType) at: 1)
						affectedActions: ((invoc affectation ) ifNil: [invoc]).
					(self getPageMetierFromClass: invoc from parentType)
						-> (self getPageMetierFromClass: (invoc to at: 1) parentType) ] ])
		select: [ :assoc | assoc key isNotNil ]
]

{ #category : #private }
CSNWebModelJava >> linkXmlUiPhaseAndPageMetier [
	^  (self modelPhases , self modelPageMetier) asSet select: [ :a | a superclass mooseName endsWith: 'Ui' ] thenCollect: [ :a | a superclass -> a ]
]

{ #category : #adding }
CSNWebModelJava >> linkXmlUiWidget [
	^ self modelWidget
		flatCollect: [ :widget | widget superclassHierarchy select: [ :class | (self isElementFromApplication: class) or: [class mooseName endsWith: 'Ui'] ] thenCollect: [ :class | class -> widget ] ]
]

{ #category : #accessing }
CSNWebModelJava >> modelPageMetier [
	^ self model allCSNPageMetier collect: #source
]

{ #category : #private }
CSNWebModelJava >> modelPhases [
	"support the C/S Phase (see application RH)"
	^ self model allCSNPage collect: #source thenReject: #isNil 
]

{ #category : #accessing }
CSNWebModelJava >> modelWidget [
	^ modelWidgetCache
		ifNil: [ modelWidgetCache := self sourceModel allClasses
				select: [ :e | 
					(e superclassHierarchy anySatisfy: [ :a | a name = 'Widget' ])
						and: [ (e container mooseName beginsWithAnyOf: self widgetNamespaces )  or: [ (e container mooseName beginsWith: self gwtWidgetNamespace )
								or: [ self isWidgetFromApplication: e ] ] ] ] ]
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
	
]

{ #category : #private }
CSNWebModelJava >> searchCalledPhase: aSignature [
	^ self getPhaseNamed: (aSignature replaceAllRegex: '\(\)' with: '')
]

{ #category : #private }
CSNWebModelJava >> searchCalledPhaseFromInvocation: invoc [
	^ self searchCalledPhase: (invoc to at: 1) signature
]

{ #category : #private }
CSNWebModelJava >> searchWidgetFromConstructorInvocation: anInvocation [
	^ self model allCSNWidget detect: [ :widget | widget sources isNotEmpty and: [ widget source = anInvocation ] ] ifNone: [ nil ]
]

{ #category : #accessing }
CSNWebModelJava >> widgetAnonymousSubclasses [
	^ ((self modelWidget flatCollect: [ :widget | widget withSubclassHierarchy ]) select: #isAnonymousClass)
]

{ #category : #accessing }
CSNWebModelJava >> widgetConstructorsInvocation [
	"Get the constructor and try to determine the stub constructor"

	^ (self modelWidget
		collect: [ :widget | 
			widget methods
				select: [ :method | 
					method isConstructor
						or: [ (method name copyReplaceAll: '.' with: '::') asSymbol = method parentType mooseName  ] ]
				thenCollect: #incomingInvocations ]) flattened asSet
]

{ #category : #accessing }
CSNWebModelJava >> widgetFactoryInvocation [
	^ (((self sourceModel allModelClasses
		select: [ :a | #(#FactoryBLLabel #ComponentUtils) includes: a name ])
		flatCollect: #methods)
		select: [ :m | m name = 'create' or: [ m name beginsWith: 'getLibelleItem' ] ]
		thenCollect: #incomingInvocations) flatten
]

{ #category : #accessing }
CSNWebModelJava >> widgetInVariable: aVariable [
	aVariable ifNil: [ ^ nil ].
	^ self model allCSNWidget detect: [ :el | ( el variable = aVariable ) ] ifNone: [ self model allCSNWidget detect: [ :el | aVariable name ~= 'content' and: [ aVariable typeScope = el realClass ] ]  ifNone: [nil]]
]

{ #category : #accessing }
CSNWebModelJava >> widgetNamespaces [
	^ {'fr::bl::client::core::refui'}
]

{ #category : #accessing }
CSNWebModelJava >> widgetOwnerCase1: invocation maxLevel: maxLevel level: level [
	| found |
	level = maxLevel ifTrue: [ ^ {  } ].
	(invocation isNil or: [ invocation isNamespace ]) ifTrue: [ ^ {  } ].
	invocation isClass
		ifFalse: [ 
			(invocation atScope: FamixTClass) ifEmpty: [ ^ {  } ].
			^ self widgetOwnerCase1: (invocation atScope: FamixTClass) first maxLevel: maxLevel level: level + 1 ]
		ifTrue: [ found := self getPhaseFromClass: invocation.
			found
				ifNotNil: [ ^ found ]
				ifNil: [ found := self getPageMetierFromClass: invocation.
					found
						ifNotNil: [ ^ found ]
						ifNil: [ found := self getCustomWidgetFromClass: invocation.
							found ifNotNil: [ ^ found ].
							invocation incomingReferences
								ifNotEmpty: [ :references | ^ self widgetOwnerCase1: (references at: 1) from belongsTo maxLevel: maxLevel level: level + 1 ] ] ] ].
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
