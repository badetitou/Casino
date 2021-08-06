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
	| newClass invoc success fail namedEntity methodInvoc1 classProperty expression type successParameter successParameterType successParameterTypeName successVariableExpression failParameter failParameterType failParameterTypeName failVariableExpression |
	expression := FASTJavaExpressionStatement new.
	invoc := FASTJavaMethodInvocation new
		name: 'generateError';
		yourself.
	type := FASTJavaVariableExpression new
		name: 'AsyncCallClass';
		yourself.
	newClass := FASTJavaNewClassExpression new
		type: type;
		yourself.
	invoc arguments add: newClass.
	success := FASTJavaMethodEntity new
		name: 'onSuccess';
		yourself.
	successParameter := FASTJavaParameter new.
	successParameterType := FASTJavaClassTypeExpression new.
	successParameterTypeName := FASTJavaTypeName new
		name: 'Void';
		yourself.
	successVariableExpression := FASTJavaVariableExpression new
		name: 'result';
		yourself.

	fail := FASTJavaMethodEntity new
		name: 'onFailure';
		yourself.
	failParameter := FASTJavaParameter new.
	failParameterType := FASTJavaClassTypeExpression new.
	failParameterTypeName := FASTJavaTypeName new
		name: 'Throwable';
		yourself.
	failVariableExpression := FASTJavaVariableExpression new
		name: 'caught';
		yourself.

	model
		addAll:
			{newClass . success . successParameter . successParameterType . successParameterTypeName . successVariableExpression . fail . type . failParameter.
			failParameterType . failParameterTypeName . failVariableExpression}.

	success addParameter: successParameter.
	successParameter variable: successVariableExpression.
	successParameter type: successParameterType.
	successParameterType typeName: successParameterTypeName.
	
	fail addParameter: failParameter.
	failParameter variable: failVariableExpression.
	failParameter type: failParameterType.
	failParameterType typeName: failParameterTypeName.

	newClass declarations add: success.
	newClass declarations add: fail.
	namedEntity := FASTJavaVariableExpression new
		name: 'IGwtServiceIncubator';
		yourself.
	methodInvoc1 := FASTJavaMethodInvocation new
		name: 'getInsctance';
		yourself.
	invoc receiver: methodInvoc1.
	classProperty := FASTJavaClassProperty new.
	methodInvoc1 receiver: classProperty.
	classProperty type: namedEntity.
	expression expression: invoc.
	model addAll: {invoc . namedEntity . methodInvoc1 . classProperty . expression}
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
