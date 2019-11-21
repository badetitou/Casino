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
	xml
		nodesDo: [ :aXmlNode | 
			(aXmlNode isElement and: [ aXmlNode name localName = 'phase' and: [ (aXmlNode attributeAt: #className ifAbsent:  [ '' ]) beginsWith: 'fr.bl.client.thot.phase' ] ])
				ifTrue: [ self factory createPageFromXMLElement: aXmlNode ] ].
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> linkXmlUiPhaseAndPageMetier [
	^ (self modelPhases , self modelPageMetier) asSet select: [ :a | a superclass mooseName endsWith: 'Ui' ] thenCollect: [ :a | a superclass -> a ]
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> linkXmlUiWidget [
	^ self modelWidget
		flatCollect: [ :widget | widget superclassHierarchy select: [ :class | class mooseName endsWith: 'Ui' ] thenCollect: [ :class | class -> widget ] ]
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> widgetNamespaces [
	^ {'fr::bl::client::core::refui' . 'fr::bl::client::thot::widgets'}
]
