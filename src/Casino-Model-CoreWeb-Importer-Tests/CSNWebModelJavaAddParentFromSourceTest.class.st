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
	^ repo / 'tests-resources' / 'tUI'
]

{ #category : #running }
CSNWebModelJavaAddParentFromSourceTest >> setUp [

	super setUp.
	responsabilityHandlerForUsages := CSNLinkWidgetResponsabilitiesReceiverHandler new.
	uiImporter xmlUiWidgetLink: CSNMultiValueDictionary new.
	(self resourcesFileReference / 'tests.json') readStreamDo: [ :stream | uiImporter sourceModel importFromJSONStream: stream ].
	uiImporter sourceModel rootFolder: self resourcesFileReference
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesSetWidget [

	self prepareSetWidget.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter addParentTo: labelWidget withHandlerForUsages: responsabilityHandlerForUsages.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesSimplestCase [

	self prepareSimplestCase.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter addParentTo: labelWidget withHandlerForUsages: responsabilityHandlerForUsages.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesSuperClassSubClass [

	self prepareSuperClassSubClass.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter addParentTo: labelWidget withHandlerForUsages: responsabilityHandlerForUsages.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesTwoMethodsAffectation [

	self prepareTwoMethodsAffectation.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter addParentTo: labelWidget withHandlerForUsages: responsabilityHandlerForUsages.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget)
]
