Class {
	#name : #CSNBehaviorImporterJavaPopUpTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaPopUpTest >> setUp [
	| window alert expression arg |
	super setUp.
	window := FASTJavaIdentifier new name: 'Window'; yourself.
	alert := FASTJavaMethodInvocation new name: 'alert';yourself.
	arg := FASTJavaStringLiteral new.
	alert arguments add: arg.
	expression := FASTJavaExpressionStatement new.
	alert receiver: window.
	expression expression: alert.
	
	model silentlyAddAll: { window. alert. expression. arg }.
	(CSNBehaviorPatternPopUp on: model) run.
]

{ #category : #tests }
CSNBehaviorImporterJavaPopUpTest >> testImportPopUpChildParent [
	self assert: model allCSNBPopUp anyOne children anyOne parentNode equals: model allCSNBPopUp anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaPopUpTest >> testImportPopUpData [
	self
		assert: model allCSNBPopUp anyOne data
		equals: (model allWithType: FASTJavaStringLiteral) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaPopUpTest >> testImportPopUpFinalSize [

	self assert: model size equals: 3
	
]

{ #category : #tests }
CSNBehaviorImporterJavaPopUpTest >> testImportPopUpParent [
	self assert: model allCSNBPopUp anyOne parentNode equals: model allFASTExpressionStatement anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaPopUpTest >> testImportPopUpParentChildren [
	self assert: model allCSNBPopUp anyOne parentNode children anyOne equals: model allCSNBPopUp anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaPopUpTest >> testImportPopUpParentChildrenSize [
	self assert: model allCSNBPopUp anyOne parentNode children size equals: 1
]

{ #category : #tests }
CSNBehaviorImporterJavaPopUpTest >> testImportPopUpType [

	self assert: model allCSNBPopUp size equals: 1
	
]
