Class {
	#name : #CSNWebModelJavaLinkWidgetWithoutAffectationTest,
	#superclass : #CSNWebModelJavaTest,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #test }
CSNWebModelJavaLinkWidgetWithoutAffectationTest >> setUp [
	super setUp.
]

{ #category : #test }
CSNWebModelJavaLinkWidgetWithoutAffectationTest >> testGetWidgetContainerOfWidgetWithoutAffectation [
	| invocationSonAnchor invocationSon widgetChild attributeParent intermediateInvocationAnchor intermediateInvocation widgetParent methodOwner |
	methodOwner := FAMIXMethod new.
	invocationSonAnchor := FAMIXIndexedFileAnchor new
		startPos: 4895;
		endPos: 4950;
		yourself.
	invocationSon := FAMIXInvocation new
		sourceAnchor: invocationSonAnchor;
		source: methodOwner;
		yourself.
	widgetChild := CSNWidget new
		addSource: invocationSon;
		yourself.
	attributeParent := FAMIXAttribute new.
	intermediateInvocationAnchor := FAMIXIndexedFileAnchor new
		startPos: 4867;
		endPos: 5027;
		yourself.
	intermediateInvocation := FAMIXInvocation new
		receiver: attributeParent;
		source: methodOwner;
		sourceAnchor: intermediateInvocationAnchor;
		yourself.
	widgetParent := CSNWidget new affectedActions: attributeParent.
	uiImporter sourceModel
		silentlyAddAll:
			{invocationSonAnchor.
			invocationSon.
			attributeParent.
			intermediateInvocationAnchor.
			intermediateInvocation.
			methodOwner}.
	uiImporter model
		silentlyAddAll:
			{widgetChild.
			widgetParent}.
	self
		assert: (uiImporter getWidgetContainerOfWidgetWithoutAffectation: widgetChild) first
		equals: widgetParent.
	self
		assert: (uiImporter getWidgetContainerOfWidgetWithoutAffectation: widgetChild) second
		equals: intermediateInvocation
]
