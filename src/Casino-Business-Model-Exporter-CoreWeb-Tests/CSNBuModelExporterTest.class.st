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

{ #category : #running }
CSNBuModelExporterTest >> setUp [
	super setUp.
	businessExporter := CSNBuModelExporter new
]

{ #category : #tests }
CSNBuModelExporterTest >> testDependencenciesOf [

	| aBusinessType buAttributeType buAttribute |
	aBusinessType := CSNBuBusinessType new
		                 name: 'HelloBusinessType';
		                 yourself.
	buAttributeType := CSNBuBusinessType new
		                   name: 'HelloAttributeBusinessType';
		                   yourself.
	buAttribute := CSNBuAttribute new.
	buAttribute name: 'myAttribute'.
	buAttribute attributeType: buAttributeType.
	buAttribute businessType: aBusinessType.
	self assert: (aBusinessType dependencies includes: buAttributeType)
]

{ #category : #tests }
CSNBuModelExporterTest >> testExportAttribute [

	| buAttributeType buAttribute expected result |
	buAttributeType := CSNBuDTO new.

	buAttribute := CSNBuAttribute new.
	buAttribute
		name: 'myAttribute';
		isFinal: false;
		isStatic: false;
		isTransient: false;
		attributeType: buAttributeType.

	expected := String crlf join:
		            #( '@JsonProperty()' 'myAttribute: any;' ).
	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter exportAttribute: buAttribute ].
	self assert: result equals: expected
]

{ #category : #tests }
CSNBuModelExporterTest >> testExportAttributeBusiness [

	| buAttributeType buAttribute expected result |
	buAttributeType := CSNBuBusinessType new.
	buAttributeType name: 'Hello'.

	buAttribute := CSNBuAttribute new.
	buAttribute
		name: 'myAttribute';
		isFinal: false;
		isStatic: false;
		isTransient: false;
		attributeType: buAttributeType.

	expected := String crlf join:
		            #( '@JsonProperty()' '@JsonClassType({ type: () => [Hello] })'
		               'myAttribute: Hello;' ).
	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter exportAttribute: buAttribute ].
	self assert: result equals: expected
]

{ #category : #tests }
CSNBuModelExporterTest >> testExportAttributeDTO [

	| buAttributeType buAttribute expected result |
	buAttributeType := CSNBuDTO new.

	buAttribute := CSNBuAttribute new.
	buAttribute
		name: 'myAttribute';
		isFinal: false;
		isStatic: false;
		isTransient: false;
		attributeType: buAttributeType.

	expected := String crlf join:
		            #( '@JsonProperty()' 'myAttribute: any;' ).
	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter exportAttribute: buAttribute ].
	self assert: result equals: expected
]

{ #category : #tests }
CSNBuModelExporterTest >> testExportAttributeDTOBusiness [

	| expected result buAttributeType |
	"inner setup"
	buAttributeType := CSNBuBusinessType new.
	buAttributeType name: 'Hello'.
	expected := 'Hello'.
	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter exportAttributeDTO: buAttributeType ].
	self assert: result equals: expected
]

{ #category : #tests }
CSNBuModelExporterTest >> testExportAttributeDTOCollectionOfDTOs [

	| expected result buAttributeType collectionType |
	"inner setup"
	collectionType := CSNBuCollectionType new.
	buAttributeType := CSNBuBusinessType new.
	buAttributeType name: 'Hello'.
	collectionType type: buAttributeType.
	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter exportAttributeDTO: collectionType ].
	expected := 'Array<Hello>'.
	self assert: result equals: expected
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
CSNBuModelExporterTest >> testPrintImportDependencenciesOf [

	| aBusinessType buAttributeType buAttribute result expected |
	aBusinessType := CSNBuBusinessType new
		                 name: 'HelloBusinessType';
		                 yourself.
	buAttributeType := CSNBuBusinessType new
		                   name: 'HelloAttributeBusinessType';
		                   yourself.
	buAttribute := CSNBuAttribute new.
	buAttribute name: 'myAttribute'.
	buAttribute attributeType: buAttributeType.
	buAttribute businessType: aBusinessType.

	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter printImportDependencenciesOf:
			          aBusinessType ].
	expected := String crlf join:
		            #( 'import {' '    HelloAttributeBusinessType'
		               '} from "..";' '' '' ).
	self assert: result equals: expected
]

{ #category : #tests }
CSNBuModelExporterTest >> testPrintImportDependencenciesOf2Attribute [

	| aBusinessType buAttributeType buAttribute result expected buAttribute2 |
	aBusinessType := CSNBuBusinessType new
		                 name: 'HelloBusinessType';
		                 yourself.
	buAttributeType := CSNBuBusinessType new
		                   name: 'HelloAttributeBusinessType';
		                   yourself.
	buAttribute := CSNBuAttribute new.
	buAttribute name: 'myAttribute'.
	buAttribute attributeType: buAttributeType.
	buAttribute businessType: aBusinessType.
	buAttribute2 := CSNBuAttribute new.
	buAttribute2 name: 'myAttribute2'.
	buAttribute2 attributeType: buAttributeType.
	buAttribute2 businessType: aBusinessType.

	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter printImportDependencenciesOf:
			          aBusinessType ].
	expected := String crlf join:
		            #( 'import {' '    HelloAttributeBusinessType'
		               '} from "..";' '' '' ).
	self assert: result equals: expected
]

{ #category : #tests }
CSNBuModelExporterTest >> testPrintImportDependencenciesOf2AttributeOfDifferentType [

	| aBusinessType buAttributeType buAttribute result expected buAttribute2 buAttribute2Type |
	aBusinessType := CSNBuBusinessType new
		                 name: 'HelloBusinessType';
		                 yourself.
	buAttributeType := CSNBuBusinessType new
		                   name: 'HelloAttributeBusinessType';
		                   yourself.
	buAttribute2Type := CSNBuBusinessType new
		                    name: 'Hello2AttributeBusinessType';
		                    yourself.
	buAttribute := CSNBuAttribute new.
	buAttribute name: 'myAttribute'.
	buAttribute attributeType: buAttributeType.
	buAttribute businessType: aBusinessType.
	buAttribute2 := CSNBuAttribute new.
	buAttribute2 name: 'myAttribute2'.
	buAttribute2 attributeType: buAttribute2Type.
	buAttribute2 businessType: aBusinessType.

	result := String streamContents: [ :stream | 
		          businessExporter currentWriteStream: stream.
		          businessExporter printImportDependencenciesOf:
			          aBusinessType ].
	expected := String crlf join:
		            #( 'import {' '    Hello2AttributeBusinessType,'
		               '    HelloAttributeBusinessType'
		               '} from "..";' '' '' ).
	self assert: result equals: expected
]
