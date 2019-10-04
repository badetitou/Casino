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
CSNWebModelJavaPostOffice >> generatePhase [
	xml
		nodesDo: [ :aXmlNode | 
			(aXmlNode isElement and: [ aXmlNode name localName = 'phase' and: [ (aXmlNode attributeAt: #className ifAbsent:  [ '' ]) beginsWith: 'fr.bl.client.thot.phase' ] ])
				ifTrue: [ self factory createPageFromXMLElement: aXmlNode ] ].
]
