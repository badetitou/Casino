Class {
	#name : #CSNWebModelJavaAddParentTest,
	#superclass : #CSNWebModelJavaTest,
	#instVars : [
		'responsabilityHandlerForUsages'
	],
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #resources }
CSNWebModelJavaAddParentTest >> affectationInParameter [
	^ 'sourceMethod(){
    Widget w = new Widget(new Label());
}'
]

{ #category : #helpers }
CSNWebModelJavaAddParentTest >> createInSourceModel: aClass [
	^ uiImporter sourceModel add: aClass new
]

{ #category : #resources }
CSNWebModelJavaAddParentTest >> prepareAffectationInParameter [
| sourceMethodSourceAnchor sourceMethod indexedAnchorInvocationWidget invocationWidget indexedAnchorInvocationLabel invocationLabel localVariable |
sourceMethodSourceAnchor := (self
		createInSourceModel: FamixJavaSourceTextAnchor)
		source: self affectationInParameter;
		yourself.
	sourceMethod := (self createInSourceModel: FamixJavaMethod)
		name: 'sourceMethod';
		sourceAnchor: sourceMethodSourceAnchor;
		yourself.
	indexedAnchorInvocationWidget := (self createInSourceModel: FamixJavaIndexedFileAnchor)
		startPos: 32;
		endPos: 55;
		yourself.
	invocationWidget := (self createInSourceModel: FamixJavaInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchorInvocationWidget.
	indexedAnchorInvocationLabel := (self createInSourceModel: FamixJavaIndexedFileAnchor)
		startPos: 43;
		endPos: 54;
		yourself.
	invocationLabel := (self createInSourceModel: FamixJavaInvocation)
		source: sourceMethod;
		sourceAnchor: indexedAnchorInvocationLabel.
	localVariable := (self createInSourceModel: FamixJavaLocalVariable)
		name: 'w';
		yourself.
	sourceMethod localVariables: {localVariable}.
]

{ #category : #running }
CSNWebModelJavaAddParentTest >> setUp [

	super setUp.
	responsabilityHandlerForUsages := CSNLinkWidgetResponsabilitiesReceiverHandler new
]

{ #category : #testing }
CSNWebModelJavaAddParentTest >> testAddParentToWithHandlerForUsages [

	self prepareAffectationInParameter
]
