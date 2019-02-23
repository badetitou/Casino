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

	| newClass invoc success fail namedEntity methodInvoc1 classProperty expression |
	expression := FASTExpressionStatement new.
	invoc := FASTJavaMethodInvocation new name: 'generateError'; yourself.
	newClass := FASTJavaNewClassExpression new type: 'AsyncCallClass'; yourself.
	invoc addArgument: newClass.
	success := FASTJavaMethodEntity new name: 'onSuccess'; yourself.
	fail := FASTJavaMethodEntity new name: 'onFailure'; yourself.
	newClass addMethod: success.
	newClass addMethod: fail.
	namedEntity := FASTNamedEntity new name: 'IGwtServiceIncubator'; yourself.
	methodInvoc1 := FASTJavaMethodInvocation new name: 'getInsctance'; yourself.
	invoc receiver: methodInvoc1.
	methodInvoc1 parentNode: invoc. 
	classProperty := FASTJavaClassProperty new.
	methodInvoc1 receiver: classProperty.
	classProperty parentNode: methodInvoc1. 
	classProperty type: namedEntity.
	namedEntity parentNode: classProperty.
	invoc parentNode: expression.
	model silentlyAddAll: { newClass. invoc. success. fail. namedEntity. methodInvoc1. classProperty. expression  }
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
