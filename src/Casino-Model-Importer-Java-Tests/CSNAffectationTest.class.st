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

{ #category : #resources }
CSNAffectationTest >> simpleAffectationToAttributeExample [
	^ 'class A {
	Widget w;
	
	sourceMethod(){
		w = new Widget();
	}
}'
]

{ #category : #resources }
CSNAffectationTest >> simpleAffectationToSuperClassAttributeExample [
	"and
class B {
	Widget w;
}"
	^ 'class A extends B {	
	sourceMethod(){
		w = new Widget();
	}
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

{ #category : #test }
CSNAffectationTest >> testAffectationToAttribute [
	"test the affectation of a new Widget to an attribute.
	
	example source code is here: simpleAffectationToAttributeExample"

	| sourceMethod invocation sourceClassSourceAnchor sourceMethodSourceAnchor indexedAnchor attribute class |
	sourceClassSourceAnchor := (self createInModel: FAMIXSourceTextAnchor)
		source: self simpleAffectationToAttributeExample;
		yourself.
	class := (self createInModel: FAMIXClass)
		name: 'A';
		sourceAnchor: sourceClassSourceAnchor;
		yourself.
	sourceMethodSourceAnchor := (self
		createInModel: FAMIXSourceTextAnchor)
		startPos: 25;
		endPos: 62;
		source: (self simpleAffectationToAttributeExample copyFrom: 25 to: 62)
		yourself.
	sourceMethod := (self createInModel: FAMIXMethod)
		name: 'sourceMethod';
		parentType: class;
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchor := (self createInModel: FAMIXSourceTextAnchor)
		startPos: 47;
		endPos: 58;
		source: (self simpleAffectationToAttributeExample copyFrom: 47 to: 58);
		yourself.
	invocation := (self createInModel: FAMIXInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchor.
	attribute := (self createInModel: FAMIXAttribute)
		name: 'w';
		yourself.
	class addAttribute: attribute.
	self assert: invocation affectation equals: attribute
]

{ #category : #test }
CSNAffectationTest >> testAffectationToSuperClassAttribute [
	"test the affectation of a new Widget to an attribute.
	
	example source code is here: simpleAffectationToSuperClassAttributeExample"

	| sourceMethod invocation sourceClassSourceAnchor sourceMethodSourceAnchor indexedAnchor attribute class classB |
	sourceClassSourceAnchor := (self createInModel: FAMIXSourceTextAnchor)
		source: self simpleAffectationToSuperClassAttributeExample;
		yourself.
	class := (self createInModel: FAMIXClass)
		name: 'A';
		sourceAnchor: sourceClassSourceAnchor;
		yourself.
	classB := (self createInModel: FAMIXClass)
		name: 'B';
		yourself.
	(self createInModel: FAMIXInheritance)
		superclass: classB;
		subclass: class.
	sourceMethodSourceAnchor := (self
		createInModel: FAMIXSourceTextAnchor)
		startPos: 23;
		endPos: 60;
		source:
			(self simpleAffectationToSuperClassAttributeExample
				copyFrom: 23
				to: 60) yourself.
	sourceMethod := (self createInModel: FAMIXMethod)
		name: 'sourceMethod';
		parentType: class;
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchor := (self createInModel: FAMIXSourceTextAnchor)
		startPos: 45;
		endPos: 56;
		source:
			(self simpleAffectationToSuperClassAttributeExample
				copyFrom: 45
				to: 56);
		yourself.
	invocation := (self createInModel: FAMIXInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchor.
	attribute := (self createInModel: FAMIXAttribute)
		name: 'w';
		yourself.
	classB addAttribute: attribute.
	self assert: invocation affectation equals: attribute
]
