Class {
	#name : #CSNBehaviorImporterJavaNavigationTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaNavigationTest >> modelMse [
	^ ReadStream on: '(
	(FAST-Core-Model.NamedEntity (id: 1)
		(name ''AbstractDesk'')
		(parentNode (ref: 2)))
	(FAST-Core-Model.ExpressionStatement (id: 3)
		(parentNode (ref: 4)))
	(FAST-Java-Model.MethodInvocation (id: 5)
		(name ''toString'')
		(parentNode (ref: 6))
		(receiver (ref: 7)))
	(FAST-Java-Model.ClassProperty (id: 8)
		(fieldName ''HAB_ALL'')
		(parentNode (ref: 9))
		(type (ref: 10)))
	(FAST-Core-Model.NamedEntity (id: 11)
		(name ''event'')
		(parentNode (ref: 12)))
	(FAST-Core-Model.NamedEntity (id: 13)
		(name ''ConstantsPhase'')
		(parentNode (ref: 14)))
	(FAST-Java-Model.MethodEntity (id: 12)
		(name ''onClick''))
	(FAST-Java-Model.ClassProperty (id: 14)
		(fieldName ''Util'')
		(parentNode (ref: 15))
		(type (ref: 13)))
	(FAST-Java-Model.MethodInvocation (id: 15)
		(name ''get'')
		(parentNode (ref: 16))
		(receiver (ref: 14)))
	(FAST-Java-Model.MethodInvocation (id: 17)
		(name ''getPhaseManager'')
		(parentNode (ref: 6))
		(receiver (ref: 18)))
	(FAST-Core-Model.NamedEntity (id: 10)
		(name ''SecurityHelper'')
		(parentNode (ref: 8)))
	(FAST-Java-Model.Identifier (id: 18)
		(name ''Workspace'')
		(parentNode (ref: 17)))
	(FAST-Core-Model.StatementBlock (id: 4)
		(parentNode (ref: 12)))
	(FAST-Java-Model.MethodInvocation (id: 9)
		(name ''withAccessRestriction'')
		(parentNode (ref: 6))
		(receiver (ref: 16)))
	(FAST-Java-Model.MethodInvocation (id: 6)
		(name ''displayPhase'')
		(parentNode (ref: 3))
		(receiver (ref: 17)))
	(FAST-Java-Model.NewExpression (id: 7)
		(name ''Date'')
		(parentNode (ref: 5)))
	(FAST-Core-Model.BooleanLiteral (id: 19)
		(parentNode (ref: 6))
		(value ''false''))
	(FAST-Java-Model.MethodInvocation (id: 16)
		(name ''PHASE_MAQUETTE_ONGLETS'')
		(parentNode (ref: 9))
		(receiver (ref: 15)))
	(FAST-Java-Model.ClassProperty (id: 2)
		(fieldName ''TYPE_TAB_UNIQUE'')
		(parentNode (ref: 6))
		(type (ref: 1))))'
]

{ #category : #running }
CSNBehaviorImporterJavaNavigationTest >> setUp [
	super setUp.
	model importFromMSEStream: self modelMse.
	(CSNBehaviorPatternNavigation on: model) run.
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationArgumentsSize [
	self
		assert: (model allWithType: CSNBNavigation) anyOne arguments size
		equals: 4
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationFinalSize [

	self assert: model size equals: 17
	
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationParent [

	self assert: (model allWithType: CSNBNavigation) anyOne parentNode equals: model allFASTExpressionStatement anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationParentChildren [

	self assert: (model allWithType: CSNBNavigation) anyOne parentNode childrenNode anyOne equals: (model allWithType: CSNBNavigation) anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationParentChildrenSize [

	self assert: (model allWithType: CSNBNavigation) anyOne parentNode childrenNode size equals: 1
	
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationType [

	self assert: (model allWithType: CSNBNavigation) size equals: 1
	
]
