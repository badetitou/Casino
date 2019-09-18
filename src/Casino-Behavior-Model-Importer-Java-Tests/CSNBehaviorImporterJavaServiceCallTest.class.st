Class {
	#name : #CSNBehaviorImporterJavaServiceCallTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#instVars : [
		'uiModel'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #testing }
CSNBehaviorImporterJavaServiceCallTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #CSNBehaviorImporterJavaServiceCallTest
]

{ #category : #running }
CSNBehaviorImporterJavaServiceCallTest >> createModel [

	| newClass invoc success fail namedEntity methodInvoc1 classProperty expression type |
	expression := FASTExpressionStatement new.
	invoc := FASTJavaMethodInvocation new name: 'generateError'; yourself.
	type := FASTJavaVariableExpression new name: 'AsyncCallClass'; yourself.
	newClass := FASTJavaNewClassExpression new type: type; yourself.
	invoc arguments add: newClass.
	success := FASTJavaMethodEntity new name: 'onSuccess'; yourself.
	fail := FASTJavaMethodEntity new name: 'onFailure'; yourself.
	model silentlyAddAll: {newClass. success. fail. type.}.
	newClass declarations add: success.
	newClass declarations add: fail.
	namedEntity := FASTJavaVariableExpression new name: 'IGwtServiceIncubator'; yourself.
	methodInvoc1 := FASTJavaMethodInvocation new name: 'getInsctance'; yourself.
	invoc receiver: methodInvoc1.
	classProperty := FASTJavaClassProperty new.
	methodInvoc1 receiver: classProperty.
	classProperty type: namedEntity.
	expression expression: invoc.
	model silentlyAddAll: { invoc. namedEntity. methodInvoc1. classProperty. expression  }
]

{ #category : #running }
CSNBehaviorImporterJavaServiceCallTest >> createUiModel [
	 self subclassResponsibility
]

{ #category : #running }
CSNBehaviorImporterJavaServiceCallTest >> setUp [
	super setUp.
	self createModel.
	self createUiModel.
	(CSNBehaviorPatternServiceCall on: model fromUiModel: uiModel) run.
]
