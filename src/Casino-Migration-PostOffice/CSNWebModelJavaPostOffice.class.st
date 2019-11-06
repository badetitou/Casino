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
		addVisitorImporter: CSNModelImporterCoreWebVisitor new;
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
	^ {self modelPhases  , self modelPageMetier} flatten asSet
		select: [ :a |  a superclass mooseName endsWith: 'Ui' ]
		thenCollect: [ :a | Association new key: a  value: a superclass]
]

{ #category : #accessing }
CSNWebModelJavaPostOffice >> linkXmlUiWidget [
	^ {self modelWidget} flatten
		select: [ :a | a superclass mooseName endsWith: 'Ui' ]
		thenCollect: [ :a | Association new key: a  value: a superclass]
]
