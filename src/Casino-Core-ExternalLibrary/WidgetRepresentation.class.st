Class {
	#name : #WidgetRepresentation,
	#superclass : #Object,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #'accessing - export' }
WidgetRepresentation class >> attributeDictionary [
	^ {  } asDictionary
]

{ #category : #export }
WidgetRepresentation class >> attributeNameInComponent: attribute [
	^ self attributeDictionary at: attribute class ifAbsent: [ attribute name ]
]

{ #category : #export }
WidgetRepresentation class >> attributeOf: aWidget [
	^ aWidget computeSelfAttributes
]

{ #category : #export }
WidgetRepresentation class >> componentAttributeOn: anExporter [
]

{ #category : #export }
WidgetRepresentation class >> componentAttributeOn: anExporter forWidget: aWidget [
	| attributes |
	attributes := self attributeOf: aWidget.
	self exportAttributes: attributes with: anExporter.
	self componentAttributeOn: anExporter
]

{ #category : #export }
WidgetRepresentation class >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter.
	self exportContentOf: aWidget with: anExporter.
	self exportFooterOf: aWidget with: anExporter.
]

{ #category : #export }
WidgetRepresentation class >> exportAttribute: attribute with: anExporter [
	anExporter <<< (anExporter protectString: attribute attributeValue asString)
]

{ #category : #export }
WidgetRepresentation class >> exportAttributes: attributes with: anExporter [
	^ (attributes flattened groupedBy: [ :attribute | self attributeNameInComponent: attribute ]) asDictionary
		associationsDo: [ :mapAttributeNameValues | 
			anExporter
				<<< ' ';
				<<< mapAttributeNameValues key;
				<<< '="'.
			mapAttributeNameValues value asOrderedCollection do: [ :attribute | anExporter visit: attribute ] separatedBy: [ anExporter <<< ' ' ].
			anExporter <<< '"' ]
]

{ #category : #export }
WidgetRepresentation class >> exportContentOf: aWidget with: anExporter [
	aWidget widgets
		do: [ :widget | 
			anExporter
				crlf;
				indentPlus.
			anExporter
				visit: widget;
				indentMinus ]
]

{ #category : #export }
WidgetRepresentation class >> exportFooterOf: aWidget with: anExporter [
	anExporter
		crlf;
		<< '</';
		<<< aWidget getSelector;
		<<< '>'
]

{ #category : #export }
WidgetRepresentation class >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter <<< '>'
]

{ #category : #accessing }
WidgetRepresentation class >> getSelector [
	^ 'div'
]

{ #category : #export }
WidgetRepresentation class >> importString [
	^ 'import { ' , self moduleName , ' } from ''' , self modulePath , ''';'
]

{ #category : #accessing }
WidgetRepresentation class >> internalDependencies [
	^ {  }
]

{ #category : #accessing }
WidgetRepresentation class >> isLocal [
	"The widget is NOT imported from a distant library
	It is already part of the exported project"
	^ true
]

{ #category : #accessing }
WidgetRepresentation class >> isNative [
	"The widget is part of the html standard"
	^ true
]

{ #category : #accessing }
WidgetRepresentation class >> moduleName [
	^ 'ElementRef'
]

{ #category : #accessing }
WidgetRepresentation class >> modulePath [
	^ '@angular/core'
]
