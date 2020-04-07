Class {
	#name : #CSNBehaviorImporterJavaNavigationTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaNavigationTest >> modelMse [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: 'public void onClick(final ClickEvent event) {              		Workspace.getPhaseManager().displayPhase(ConstantsPhase.Util.get().PHASE_MAQUETTE_SANDBOX().withAccessRestriction(SecurityHelper.HAB_ALL), (new Date()).toString(), AbstractDesk.TYPE_POPUP_MODAL, true); }'
]

{ #category : #running }
CSNBehaviorImporterJavaNavigationTest >> setUp [
	super setUp.
	model := self modelMse
		metamodel: CSNBModel metamodel;
		yourself.
	(CSNBehaviorPatternNavigation on: model) run
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationArgumentsSize [
	self
		assert: (model allWithType: CSNBNavigation) anyOne arguments size
		equals: 4
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationChildParent [
	self assert: ((model allWithType: CSNBNavigation) anyOne children allSatisfy: [ :child | child parentNode = (model allWithType: CSNBNavigation) anyOne ])
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationParent [

	self assert: (model allWithType: CSNBNavigation) anyOne parentNode equals: model allFASTExpressionStatement anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationParentChildren [
	self assert: (model allWithType: CSNBNavigation) anyOne parentNode children anyOne equals: (model allWithType: CSNBNavigation) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationParentChildrenSize [
	self assert: (model allWithType: CSNBNavigation) anyOne parentNode children size equals: 1
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationType [

	self assert: (model allWithType: CSNBNavigation) size equals: 1
	
]
