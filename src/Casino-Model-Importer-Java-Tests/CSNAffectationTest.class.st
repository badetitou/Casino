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
	model := FamixJavaModel new
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
		createInModel: FamixJavaSourceTextAnchor)
		source: self simpleAffectationExample;
		yourself.
	sourceMethod := (self createInModel: FamixJavaMethod)
		name: 'sourceMethod';
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchor := (self createInModel: FamixJavaIndexedFileAnchor)
		startPos: 32;
		endPos: 44;
		yourself.
	invocation := (self createInModel: FamixJavaInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchor.
	localVariable := (self createInModel: FamixJavaLocalVariable)
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
		createInModel: FamixJavaSourceTextAnchor)
		source: self affectationInParameter;
		yourself.
	sourceMethod := (self createInModel: FamixJavaMethod)
		name: 'sourceMethod';
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchorInvocationWidget := (self createInModel: FamixJavaIndexedFileAnchor)
		startPos: 32;
		endPos: 55;
		yourself.
	invocationWidget := (self createInModel: FamixJavaInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchorInvocationWidget.
	indexedAnchorInvocationLabel := (self createInModel: FamixJavaIndexedFileAnchor)
		startPos: 43;
		endPos: 54;
		yourself.
	invocationLabel := (self createInModel: FamixJavaInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchorInvocationLabel.
	localVariable := (self createInModel: FamixJavaLocalVariable)
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
	sourceClassSourceAnchor := (self createInModel: FamixJavaSourceTextAnchor)
		source: self simpleAffectationToAttributeExample;
		yourself.
	class := (self createInModel: FamixJavaClass)
		name: 'A';
		sourceAnchor: sourceClassSourceAnchor;
		yourself.
	sourceMethodSourceAnchor := (self
		createInModel: FamixJavaSourceTextAnchor)
		startPos: 25;
		endPos: 62;
		source: (self simpleAffectationToAttributeExample copyFrom: 25 to: 62)
		yourself.
	sourceMethod := (self createInModel: FamixJavaMethod)
		name: 'sourceMethod';
		parentType: class;
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchor := (self createInModel: FamixJavaSourceTextAnchor)
		startPos: 47;
		endPos: 58;
		source: (self simpleAffectationToAttributeExample copyFrom: 47 to: 58);
		yourself.
	invocation := (self createInModel: FamixJavaInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchor.
	attribute := (self createInModel: FamixJavaAttribute)
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
	sourceClassSourceAnchor := (self createInModel: FamixJavaSourceTextAnchor)
		                           source: self simpleAffectationToSuperClassAttributeExample;
		                           yourself.
	class := (self createInModel: FamixJavaClass)
		         name: 'A';
		         sourceAnchor: sourceClassSourceAnchor;
		         yourself.
	classB := (self createInModel: FamixJavaClass)
		          name: 'B';
		          yourself.
	(self createInModel: FamixJavaInheritance)
		superclass: classB;
		subclass: class.
	sourceMethodSourceAnchor := (self createInModel: FamixJavaSourceTextAnchor)
		                            startPos: 23;
		                            endPos: 60;
		                            source: (self simpleAffectationToSuperClassAttributeExample copyFrom: 23 to: 60) yourself.
	sourceMethod := (self createInModel: FamixJavaMethod)
		                name: 'sourceMethod';
		                parentType: class;
		                sourceAnchor: sourceMethodSourceAnchor;
		                yourself.
	indexedAnchor := (self createInModel: FamixJavaSourceTextAnchor)
		                 startPos: 45;
		                 endPos: 56;
		                 source: (self simpleAffectationToSuperClassAttributeExample copyFrom: 45 to: 56);
		                 yourself.
	invocation := (self createInModel: FamixJavaInvocation)
		              source: sourceMethod;
		              sourceAnchor: indexedAnchor.
	attribute := (self createInModel: FamixJavaAttribute)
		             name: 'w';
		             yourself.
	classB addAttribute: attribute.
	self assert: invocation affectation equals: attribute
]
