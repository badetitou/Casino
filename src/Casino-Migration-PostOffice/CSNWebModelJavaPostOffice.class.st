Class {
	#name : #CSNWebModelJavaPostOffice,
	#superclass : #CSNWebModelJava,
	#category : #'Casino-Migration-PostOffice'
}

{ #category : #accessing }
CSNWebModelJavaPostOffice >> applicationSource [
	"name of the directory with the GWT application"
	^  'BLThotGwt'
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> createFactory [
	factory := CSNWidgetFactoryAngular new
		model: model;
		importer: self;
		addVisitorImporter: CSNModelImporterCoreWebPostOfficeVisitor new;
		yourself
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> generatePhase [

	xml allNodesDo: [ :aXmlNode | 
		(aXmlNode isElement and: [ aXmlNode name = 'phase' and: [ (aXmlNode attributeAt: #className ifAbsent: [ '' ]) beginsWith: 'fr.bl.client.thot.phase' ] ]) 
			ifTrue: [ self factory createPageFromXMLElement: aXmlNode ] ]
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> isInFactory: invocationOrClass [
	"used in PostOffice cause some factory are defined inside the PostOffice application \ie createBLLinkLabel"

	invocationOrClass isClass ifTrue: [ ^ false ].
	^ (invocationOrClass source atScope: FamixTMethod) anyOne name = 'createBLLinkLabel'
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> linkFromWidgetActionAppel [
	"the uncommented line is to wait behavioral code"
	
	^ self getPhaseCallInvocations
		collect: [ :el | 
			| link |
			link := self linkFromWidgetActionAppelCase1: el.
			link ifNil: [ link := self linkFromWidgetActionAppelCase2: el ].
			link ]
		thenSelect: #isNotNil
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> linkXmlUiPhaseAndPageMetier [
	^ (self modelPhases , self modelPageMetier) asSet select: [ :a | a superclass mooseName endsWith: 'Ui' ] thenCollect: [ :a | a superclass -> a ]
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> linkXmlUiWidget [
  ^self modelWidget flatCollect: [:widget |  widget superclassHierarchy select: [:class |  self isElementFromApplication: class ] thenCollect: [:class |  class -> widget ] ]
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> webRoot [
	^ 'https://pofrap1lagbl:15443/interrop/thot/' 
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> widgetFactoryInvocation [
	^ (((self sourceModel allModelClasses
		select: [ :a | #(#FactoryBLLabel #ComponentUtils #AbstractPhaseBurAdminUi) includes: a name ])
		flatCollect: #methods)
		select: [ :m | m name = 'create' or: [ m name beginsWithAnyOf: #('getLibelleItem' 'createBLLinkLabel') ] ]
		thenCollect: #incomingInvocations) flatten
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> widgetNamespaces [
	^ {'fr::bl::client::core::refui' . 'fr::bl::client::thot::widgets'}
]
