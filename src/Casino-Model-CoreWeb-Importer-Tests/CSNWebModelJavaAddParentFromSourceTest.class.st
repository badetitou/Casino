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
CSNWebModelJavaAddParentFromSourceTest >> prepareTwoMethodsAffectation [

	containerWidget := (self createInUIModel: CSNContainer) affectedActions:
		                   ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var name = 'w' ]).
	labelWidget := (self createInUIModel: CSNUIParagraph) affectedActions:
		               ((uiImporter sourceModel allWithType: FamixJavaLocalVariable) detect: [ :var | var name = 'l' ])
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
	^ repo / 'tests-resources' / 'tUI' / 'tests.json'
]

{ #category : #running }
CSNWebModelJavaAddParentFromSourceTest >> setUp [

	super setUp.
	responsabilityHandlerForUsages := CSNLinkWidgetResponsabilitiesReceiverHandler new.
	self resourcesFileReference readStreamDo: [ :stream | uiImporter sourceModel importFromJSONStream: stream ]
]

{ #category : #testing }
CSNWebModelJavaAddParentFromSourceTest >> testAddParentToWithHandlerForUsagesTwoMethodsAffectation [

	self prepareTwoMethodsAffectation.
	
]
