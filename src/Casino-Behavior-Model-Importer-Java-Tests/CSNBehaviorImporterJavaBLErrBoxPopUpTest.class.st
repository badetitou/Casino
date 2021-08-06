Class {
	#name : #CSNBehaviorImporterJavaBLErrBoxPopUpTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> setUp [
	| window alert expression arg |
	super setUp.
	window := FASTJavaIdentifier new
		name: 'BLErrBox';
		yourself.
	alert := FASTJavaMethodInvocation new
		name: 'alert';
		yourself.
	arg := FASTJavaStringLiteral new.
	alert arguments add: arg.
	expression := FASTJavaExpressionStatement new.
	alert receiver: window.
	expression expression: alert.
	model silentlyAddAll: {window . alert . expression . arg}.
	(CSNBehaviorPatternBLErrBoxPopUp on: model) run
]

{ #category : #tests }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> testImportPopUpChildParent [
	self assert: model allCSNBPopUp anyOne children anyOne parentNode equals: model allCSNBPopUp anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> testImportPopUpData [
	self
		assert: model allCSNBPopUp anyOne data
		equals: (model allWithType: FASTJavaStringLiteral) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> testImportPopUpFinalSize [

	self assert: model size equals: 3
	
]

{ #category : #tests }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> testImportPopUpParent [
	self assert: model allCSNBPopUp anyOne parentNode equals: model allFASTExpressionStatement anyOne
	
]

{ #category : #tests }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> testImportPopUpParentChildren [
	self assert: model allCSNBPopUp anyOne parentNode children anyOne equals: model allCSNBPopUp anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> testImportPopUpParentChildrenSize [
	self assert: model allCSNBPopUp anyOne parentNode children size equals: 1
]

{ #category : #tests }
CSNBehaviorImporterJavaBLErrBoxPopUpTest >> testImportPopUpType [

	self assert: model allCSNBPopUp size equals: 1
	
]
