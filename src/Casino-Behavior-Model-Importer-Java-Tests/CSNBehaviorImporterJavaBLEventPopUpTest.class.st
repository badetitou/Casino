Class {
	#name : #CSNBehaviorImporterJavaBLEventPopUpTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaBLEventPopUpTest >> setUp [
	| window alert expression arg |
	super setUp.
	window := FASTJavaIdentifier new name: 'BLEventPopup'; yourself.
	alert := FASTJavaMethodInvocation new name: 'alert';yourself.
	arg := FASTJavaStringLiteral new.
	alert arguments add: arg.
	expression := FASTExpressionStatement new.
	alert receiver: window.
	expression expression: alert.
	
	model silentlyAddAll: { window. alert. expression. arg }.
	(CSNBehaviorPatternBLEventPopUp on: model) run.
]

{ #category : #tests }
CSNBehaviorImporterJavaBLEventPopUpTest >> testImportPopUpChildParent [
	self assert: model allCSNBPopUp anyOne childrenNode anyOne parentNode equals: model allCSNBPopUp anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaBLEventPopUpTest >> testImportPopUpData [
	self
		assert: model allCSNBPopUp anyOne data
		equals: (model allWithType: FASTJavaStringLiteral) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaBLEventPopUpTest >> testImportPopUpFinalSize [

	self assert: model size equals: 3
	
]

{ #category : #tests }
CSNBehaviorImporterJavaBLEventPopUpTest >> testImportPopUpParent [
	self assert: model allCSNBPopUp anyOne parentNode equals: model allFASTExpressionStatement anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaBLEventPopUpTest >> testImportPopUpParentChildren [
	self assert: model allCSNBPopUp anyOne parentNode childrenNode anyOne equals: model allCSNBPopUp anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaBLEventPopUpTest >> testImportPopUpParentChildrenSize [
	self assert: model allCSNBPopUp anyOne parentNode childrenNode size equals: 1
	
]

{ #category : #tests }
CSNBehaviorImporterJavaBLEventPopUpTest >> testImportPopUpType [

	self assert: model allCSNBPopUp size equals: 1
	
]
