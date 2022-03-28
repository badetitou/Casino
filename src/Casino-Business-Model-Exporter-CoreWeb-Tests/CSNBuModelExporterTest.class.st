"
A CSNBuModelExporterTest is a test class for testing the behavior of CSNBuModelExporter
"
Class {
	#name : #CSNBuModelExporterTest,
	#superclass : #TestCase,
	#instVars : [
		'businessExporter'
	],
	#category : #'Casino-Business-Model-Exporter-CoreWeb-Tests'
}

{ #category : #test }
CSNBuModelExporterTest >> setUp [
	super setUp.
	businessExporter := CSNBuModelExporter new
]

{ #category : #test }
CSNBuModelExporterTest >> testExportAttributeGetter [

	| expected result buAttribute buAttributeType |
	"inner setup"
	buAttributeType := CSNBuDTO new.

	buAttribute := CSNBuAttribute new.
	buAttribute name: 'myAttribute'.
	buAttribute attributeType: buAttributeType.

	expected := String crlf join:
		            #( 'getMyAttribute() {'
		               '    return this.myAttribute;'
		               '}' ).
	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter exportAttributeGetter: buAttribute ].
	self assert: result equals: expected
]

{ #category : #test }
CSNBuModelExporterTest >> testExportAttributeSetter [

	| expected result buAttribute buAttributeType |
	"inner setup"
	buAttributeType := CSNBuDTO new.

	buAttribute := CSNBuAttribute new.
	buAttribute name: 'myAttribute'.
	buAttribute attributeType: buAttributeType.

	expected := String crlf join:
		            #( 'setMyAttribute(myAttribute: any) {'
		               '    this.myAttribute = myAttribute;'
		               '}' ).
	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter exportAttributeSetter: buAttribute ].
	self assert: result equals: expected
]
