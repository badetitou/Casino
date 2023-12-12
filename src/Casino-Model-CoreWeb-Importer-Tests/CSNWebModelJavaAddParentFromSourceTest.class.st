Class {
	#name : #CSNWebModelJavaAddParentFromSourceTest,
	#superclass : #CSNWebModelJavaTest,
	#instVars : [
		'responsabilityHandlerForUsages',
		'containerWidget',
		'labelWidget',
		'localVariable',
		'localVariableLabel'
	],
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #helpers }
CSNWebModelJavaAddParentFromSourceTest >> createInUIModel: aClass [
	^ uiImporter model add: aClass new
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> prepareMethodReturn [

	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions:
			                   ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::MethodReturn.build().w' ]);
		                   source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'Widget()' and: [ invoc sender mooseName = #'hello::MethodReturn.build()' ] ]);
		                   yourself.
	labelWidget := (self createInUIModel: CSNUIParagraph)
		               affectedActions:
			               ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::MethodReturn.newLabel().l' ]);
		               source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                invoc signature = 'Label()' and: [ invoc sender mooseName = #'hello::MethodReturn.newLabel()' ] ]);
		               yourself
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> prepareMethodReturnDirect [

	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions:
			                   ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::MethodReturnDirect.build().w' ]);
		                   source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'Widget()' and: [ invoc sender mooseName = #'hello::MethodReturnDirect.build()' ] ]);
		                   yourself.
	labelWidget := (self createInUIModel: CSNUIParagraph)
		               source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                invoc signature = 'Label()' and: [ invoc sender mooseName = #'hello::MethodReturnDirect.newLabel()' ] ]);
		               yourself
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> prepareMethodReturnNearlyDirect [

	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions:
			                   ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | 
					                    var mooseName = #'hello::MethodReturnNearlyDirect.build().w' ]);
		                   source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'Widget()' and: [ invoc sender mooseName = #'hello::MethodReturnNearlyDirect.build()' ] ]);
		                   yourself.
	labelWidget := (self createInUIModel: CSNUIParagraph)
		               affectedActions:
			               ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | 
					                var mooseName = #'hello::MethodReturnNearlyDirect.newLabel().l' ]);
		               source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                invoc signature = 'Label()' and: [ invoc sender mooseName = #'hello::MethodReturnNearlyDirect.newLabel()' ] ]);
		               yourself
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> prepareSetWidget [

	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions:
			                   ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::SetWidget.build().w' ]);
		                   source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'Widget()' and: [ invoc sender mooseName = #'hello::SetWidget.build()' ] ]);
		                   yourself.
	labelWidget := (self createInUIModel: CSNUIParagraph)
		               source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                invoc signature = 'Label()' and: [ invoc sender mooseName = #'hello::SetWidget.build()' ] ]);
		               yourself
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> prepareSimplestCase [

	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions:
			                   ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::SimplestCase.sourceMethod().w' ]);
		                   source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'Widget()' and: [ invoc sender mooseName = #'hello::SimplestCase.sourceMethod()' ] ]);
		                   yourself.
	labelWidget := (self createInUIModel: CSNUIParagraph)
		               affectedActions: ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::SimplestCase.sourceMethod().l' ]);
		               source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                invoc signature = 'Label()' and: [ invoc sender mooseName = #'hello::SimplestCase.sourceMethod()' ] ]);
		               yourself
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> prepareSuperClassSubClass [
	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions: ((uiImporter sourceModel allWithType: FamixJavaAttribute ) detect: [ :var | var name = 'widgetInSuperClass' ]);
		                   source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'Widget()' and: [ invoc sender mooseName = #'hello::SuperClass.<Initializer>()' ] ]);
		                   yourself.
	labelWidget := (self createInUIModel: CSNUIParagraph)
		               affectedActions: ((uiImporter sourceModel allWithType: FamixJavaAttribute) detect: [ :var | var name = 'otherWidgetInSuperClass' ]);
		               source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                invoc signature = 'Label()' and: [ invoc sender mooseName =#'hello::SuperClass.<Initializer>()' ] ]);
		               yourself
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> prepareTwoMethodsAffectation [

	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions:
			                   ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::Hello.sourceMethod().w' ]);
		                   source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'Widget()' and: [ invoc sender mooseName = #'hello::Hello.sourceMethod()' ] ]);
		                   yourself.
	labelWidget := (self createInUIModel: CSNUIParagraph)
		               affectedActions: ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var mooseName = #'hello::Hello.sourceMethod().l' ]);
		               source: ((uiImporter sourceModel allWithType: FamixJavaInvocation) detect: [ :invoc | 
					                invoc signature = 'Label()' and: [ invoc sender mooseName = #'hello::Hello.sourceMethod()' ] ]);
		               yourself
]

{ #category : #resources }
CSNWebModelJavaAddParentFromSourceTest >> resourcesFileReference [
	| repo filePath |
	filePath := '/home/runner/work/Casino/Casino'.
	repo := filePath asFileReference exists
		ifTrue: [ filePath asFileReference ]
		ifFalse: [ (IceRepository registry
				detect: [ :each | each includesPackageNamed: self class package name ]
				ifNone: [ self error: 'Please add a clone of this project to Iceberg to access to the resources' ]) location ].
	^ repo / 'tests-resources' / 'tUI' / 'hello'
]

{ #category : #running }
CSNWebModelJavaAddParentFromSourceTest >> setUp [

	super setUp.
	uiImporter xmlUiWidgetLink: CSNMultiValueDictionary new.
	(self resourcesFileReference / 'tests.json') readStreamDo: [ :stream | uiImporter sourceModel importFromJSONStream: stream ].
	uiImporter sourceModel rootFolder: self resourcesFileReference
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesMethodReturn [
	self prepareMethodReturn.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter computeChildrenOf: containerWidget.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesMethodReturnDirect [

	self prepareMethodReturnDirect.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter computeChildrenOf: containerWidget.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesMethodReturnNearlyDirect [

	self prepareMethodReturnNearlyDirect.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter computeChildrenOf: containerWidget.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesSetWidget [

	self prepareSetWidget.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter computeChildrenOf: containerWidget.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesSimplestCase [

	self prepareSimplestCase.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter computeChildrenOf: containerWidget.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesSuperClassSubClass [

	self prepareSuperClassSubClass.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter computeChildrenOf: containerWidget.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesTwoMethodsAffectation [

	self prepareTwoMethodsAffectation.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter computeChildrenOf: containerWidget.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testInnerWidget [

	| innerWidget1 innerWidget2 innerWidget3 |
	innerWidget1 := (self createInUIModel: CSNContainer)
		                affectedActions:
			                ((uiImporter sourceModel allWithType:
					                  FamixJavaLocalVariable) detect: [ :var | 
					                 var name = #innerWidget1 ]);
		                source:
			                ((uiImporter sourceModel allWithType:
					                  FamixJavaInvocation) detect: [ :invoc | 
					                 invoc signature = 'Widget()' and: [ 
							                 invoc affectation name = #innerWidget1 ] ]);
		                yourself.
	innerWidget2 := (self createInUIModel: CSNContainer)
		                affectedActions:
			                ((uiImporter sourceModel allWithType:
					                  FamixJavaLocalVariable) detect: [ :var | 
					                 var name = #innerWidget2 ]);
		                source:
			                ((uiImporter sourceModel allWithType:
					                  FamixJavaInvocation) detect: [ :invoc | 
					                 invoc signature = 'Widget()' and: [ 
							                 invoc affectation name = #innerWidget2 ] ]);
		                yourself.
	innerWidget3 := (self createInUIModel: CSNContainer)
		                affectedActions:
			                ((uiImporter sourceModel allWithType:
					                  FamixJavaLocalVariable) detect: [ :var | 
					                 var name = #innerWidget3 ]);
		                source:
			                ((uiImporter sourceModel allWithType:
					                  FamixJavaInvocation) detect: [ :invoc | 
					                 invoc signature = 'Widget()' and: [ 
							                 invoc affectation name = #innerWidget3 ] ]);
		                yourself.
	containerWidget := (self createInUIModel: CSNContainer)
		                   affectedActions:
			                   ((uiImporter sourceModel allWithType:
					                     FamixJavaAttribute) detect: [ :var | 
					                    var name = #child ]);
		                   source:
			                   ((uiImporter sourceModel allWithType:
					                     FamixJavaInvocation) detect: [ :invoc | 
					                    invoc signature = 'ChildClass()' and: [ 
							                    invoc affectation name = #child ] ]);
		                   realClass:
			                   ((uiImporter sourceModel allWithType:
					                     FamixJavaClass) detect: [ :cc | 
					                    cc name = 'ChildClass' ]) yourself.
	uiImporter computeChildrenOf: containerWidget.
	self assert: innerWidget1 widgetContainer equals: containerWidget.
	self assert: innerWidget2 widgetContainer equals: containerWidget.
	self assert: innerWidget3 widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: innerWidget1).
	self assert: (containerWidget widgets includes: innerWidget2).
	self assert: (containerWidget widgets includes: innerWidget3)
]
