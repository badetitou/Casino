Class {
	#name : #CSNWebModelJavaAddParentTest,
	#superclass : #CSNWebModelJavaTest,
	#instVars : [
		'responsabilityHandlerForUsages',
		'containerWidget',
		'labelWidget'
	],
	#classInstVars : [
		'invocationLabel'
	],
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #resources }
CSNWebModelJavaAddParentTest >> affectationInParameter [
	^ 'sourceMethod(){
    Widget w = new Widget();
    Label l = new Label();
    w.add(l);
}'
]

{ #category : #helpers }
CSNWebModelJavaAddParentTest >> createInSourceModel: aClass [
	^ uiImporter sourceModel add: aClass new
]

{ #category : #helpers }
CSNWebModelJavaAddParentTest >> createInUIModel: aClass [
	^ uiImporter model add: aClass new
]

{ #category : #resources }
CSNWebModelJavaAddParentTest >> prepareAffectationInParameter [

	| sourceMethodSourceAnchor sourceMethod indexedAnchorInvocationWidget invocationWidget indexedAnchorInvocationLabel invocationLabel localVariable localVariableLabel addInvocation addInvocationAnchor |
	sourceMethodSourceAnchor := (self createInSourceModel: FamixJavaSourceTextAnchor)
		                            source: self affectationInParameter;
		                            yourself.
	sourceMethod := (self createInSourceModel: FamixJavaMethod)
		                name: 'sourceMethod';
		                sourceAnchor: sourceMethodSourceAnchor;
		                yourself.
	indexedAnchorInvocationWidget := (self createInSourceModel: FamixJavaIndexedFileAnchor)
		                                 startPos: 32;
		                                 endPos: 43;
		                                 yourself.
	invocationWidget := (self createInSourceModel: FamixJavaInvocation)
		                    source: sourceMethod;
		                    signature: 'Widget()';
		                    sourceAnchor: indexedAnchorInvocationWidget.
	indexedAnchorInvocationLabel := (self createInSourceModel: FamixJavaIndexedFileAnchor)
		                                startPos: 60;
		                                endPos: 70;
		                                yourself.
	invocationLabel := (self createInSourceModel: FamixJavaInvocation)
		                   source: sourceMethod;
		                   signature: 'Label()';
		                   sourceAnchor: indexedAnchorInvocationLabel.
	localVariable := (self createInSourceModel: FamixJavaLocalVariable)
		                 name: 'w';
		                 yourself.
	localVariableLabel := (self createInSourceModel: FamixJavaLocalVariable)
		                      name: 'l';
		                      yourself.
	addInvocationAnchor := (self createInSourceModel: FamixJavaIndexedFileAnchor)
		                       startPos: 67;
		                       endPos: 84;
		                       yourself.
	addInvocation := (self createInSourceModel: FamixJavaInvocation)
		                 signature: 'add(l)';
		                 source: sourceMethod;
		                 sourceAnchor: addInvocationAnchor;
		                 receiver: localVariable;
		                 addCandidate: ((self createInSourceModel: FamixJavaMethod) isStub: true).
	sourceMethod localVariables: { 
			localVariable.
			localVariableLabel }.

	containerWidget := (self createInUIModel: CSNContainer) affectedActions: localVariable.
	labelWidget := (self createInUIModel: CSNUIParagraph) affectedActions: localVariableLabel
]

{ #category : #resources }
CSNWebModelJavaAddParentTest >> resourcesFileReference [
	| repo filePath |
	filePath := '/home/runner/work/Casino/Casino'.
	repo := filePath asFileReference exists
		ifTrue: [ filePath asFileReference ]
		ifFalse: [ (IceRepository registry
				detect: [ :each | each includesPackageNamed: self class package name ]
				ifNone: [ self error: 'Please add a clone of this project to Iceberg to access to the resources' ]) location ].
	^ repo / 'tests-resources'
]

{ #category : #running }
CSNWebModelJavaAddParentTest >> setUp [

	super setUp.
	responsabilityHandlerForUsages := CSNLinkWidgetResponsabilitiesReceiverHandler new
]

{ #category : #testing }
CSNWebModelJavaAddParentTest >> testAddParentToWithHandlerForUsages [

	self prepareAffectationInParameter.
	self assert: labelWidget widgetContainer equals: nil.
	self assert: containerWidget widgets isEmpty.
	uiImporter addParentTo: labelWidget withHandlerForUsages: responsabilityHandlerForUsages.
	self assert: labelWidget widgetContainer equals: containerWidget.
	self assert: (containerWidget widgets includes: labelWidget).
]

{ #category : #resources }
CSNWebModelJavaAddParentTest >> twoMethodsAffectation [
	^ 'package hello;

public class Hello {
    
    void sourceMethod(){
        Widget w = new Widget();
        Label l = new Label();
        anotherMethod();
    }

    void anotherMethod() {
        w.add(l);
    }
}'
]
