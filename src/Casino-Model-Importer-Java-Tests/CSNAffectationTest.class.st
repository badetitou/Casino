Class {
	#name : #CSNAffectationTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Casino-Model-Importer-Java-Tests'
}

{ #category : #resources }
CSNAffectationTest >> affectationInParameter [
	^ 'sourceMethod(){
    Widget w = new Widget(new Label());
}'
]

{ #category : #helper }
CSNAffectationTest >> createInModel: aClass [
	^ model add: aClass new
]

{ #category : #setUp }
CSNAffectationTest >> setUp [ 
	super setUp.
	model := FAMIXModel new
]

{ #category : #resources }
CSNAffectationTest >> simpleAffectationExample [
	^ 'sourceMethod(){
    Widget w = new Widget();
}'
]

{ #category : #test }
CSNAffectationTest >> testAffectation [
	"test the affectation of a new Widget to a variable.
	
	example source code is here: simpleAffectationExample"

	| sourceMethod invocation sourceMethodSourceAnchor indexedAnchor localVariable |
	sourceMethodSourceAnchor := (self
		createInModel: FAMIXSourceTextAnchor)
		source: self simpleAffectationExample;
		yourself.
	sourceMethod := (self createInModel: FAMIXMethod)
		name: 'sourceMethod';
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchor := (self createInModel: FAMIXIndexedFileAnchor)
		startPos: 32;
		endPos: 44;
		yourself.
	invocation := (self createInModel: FAMIXInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchor.
	localVariable := (self createInModel: FAMIXLocalVariable)
		name: 'w';
		yourself.
	sourceMethod localVariables: {localVariable}.
	self assert: invocation affectation equals: localVariable
]

{ #category : #test }
CSNAffectationTest >> testAffectationInParameter [
	"We are testing that the Invocation 'new Label()' is not affected to Widget w.
	
	example source code is here: affectationInParameter"

	| sourceMethod invocationWidget sourceMethodSourceAnchor indexedAnchorInvocationWidget localVariable invocationLabel indexedAnchorInvocationLabel |
	sourceMethodSourceAnchor := (self
		createInModel: FAMIXSourceTextAnchor)
		source: self affectationInParameter;
		yourself.
	sourceMethod := (self createInModel: FAMIXMethod)
		name: 'sourceMethod';
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchorInvocationWidget := (self createInModel: FAMIXIndexedFileAnchor)
		startPos: 32;
		endPos: 55;
		yourself.
	invocationWidget := (self createInModel: FAMIXInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchorInvocationWidget.
	indexedAnchorInvocationLabel := (self createInModel: FAMIXIndexedFileAnchor)
		startPos: 43;
		endPos: 54;
		yourself.
	invocationLabel := (self createInModel: FAMIXInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchorInvocationLabel.
	localVariable := (self createInModel: FAMIXLocalVariable)
		name: 'w';
		yourself.
	sourceMethod localVariables: {localVariable}.
	self assert: invocationWidget affectation equals: localVariable.
	self assert: invocationLabel affectation equals: nil
]
