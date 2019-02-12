Class {
	#name : #CSNBehaviorImporterJavaNavigationTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaNavigationTest >> modelMse [
	^ ReadStream on: '(
	(FAST-Core-Model.JavaMethodInvocation (id: 1)
		(name ''getPhaseManager'')
		(parentNode (ref: 2))
		(receiver (ref: 3)))
	(FAST-Core-Model.JavaMethodInvocation (id: 2)
		(name ''displayPhase'')
		(parentNode (ref: 4))
		(receiver (ref: 1)))
	(FAST-Core-Model.JavaClassProperty (id: 5)
		(fieldName ''TYPE_TAB_UNIQUE'')
		(parentNode (ref: 2))
		(type (ref: 6)))
	(FAST-Core-Model.JavaMethodInvocation (id: 7)
		(name ''withAccessRestriction'')
		(parentNode (ref: 2))
		(receiver (ref: 8)))
	(FAST-Core-Model.JavaClassProperty (id: 9)
		(fieldName ''HAB_ALL'')
		(parentNode (ref: 7))
		(type (ref: 10)))
	(FAST-Core-Model.NamedEntity (id: 11)
		(name ''ConstantsPhase'')
		(parentNode (ref: 12)))
	(FAST-Core-Model.JavaNewExpression (id: 13)
		(name ''Date'')
		(parentNode (ref: 14)))
	(FAST-Core-Model.NamedEntity (id: 15)
		(name ''event'')
		(parentNode (ref: 16)))
	(FAST-Core-Model.NamedEntity (id: 10)
		(name ''SecurityHelper'')
		(parentNode (ref: 9)))
	(FAST-Core-Model.NamedEntity (id: 6)
		(name ''AbstractDesk'')
		(parentNode (ref: 5)))
	(FAST-Core-Model.JavaMethodEntity (id: 16)
		(name ''onClick''))
	(FAST-Core-Model.JavaMethodInvocation (id: 14)
		(name ''toString'')
		(parentNode (ref: 2))
		(receiver (ref: 13)))
	(FAST-Core-Model.JavaMethodInvocation (id: 17)
		(name ''get'')
		(parentNode (ref: 8))
		(receiver (ref: 12)))
	(FAST-Core-Model.StatementBlock (id: 18)
		(parentNode (ref: 16)))
	(FAST-Core-Model.ExpressionStatement (id: 4)
		(parentNode (ref: 18)))
	(FAST-Core-Model.JavaMethodInvocation (id: 8)
		(name ''PHASE_MAQUETTE_ONGLETS'')
		(parentNode (ref: 7))
		(receiver (ref: 17)))
	(FAST-Core-Model.JavaClassProperty (id: 12)
		(fieldName ''Util'')
		(parentNode (ref: 17))
		(type (ref: 11)))
	(FAST-Core-Model.BooleanLiteral (id: 19)
		(parentNode (ref: 2))
		(value ''false'')))'
]

{ #category : #running }
CSNBehaviorImporterJavaNavigationTest >> setUp [
	super setUp.
	model importFromMSEStream: self modelMse.
	(CSNBehaviorPatternPopUp on: model) run.
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationData [
	self
		assert: model allCSNBPopUp anyOne data
		equals: (model allWithType: FASTJavaStringLiteral) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationFinalSize [

	self assert: model size equals: 3
	
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationParent [

	self assert: model allCSNBPopUp anyOne parentNode equals: model allFASTExpressionStatement anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaNavigationTest >> testImportNavigationType [

	self assert: model allCSNBPopUp size equals: 1
	
]
