Class {
	#name : #WidgetRepresentation,
	#superclass : #Object,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #'accessing - export' }
WidgetRepresentation >> attributeDictionary [
	^ {  } asDictionary
]

{ #category : #export }
WidgetRepresentation >> attributeNameInComponent: attribute [
	^ self attributeDictionary at: attribute class ifAbsent: [ attribute name ]
]

{ #category : #export }
WidgetRepresentation >> attributeOf: aWidget [
	^ aWidget computeSelfAttributes
]

{ #category : #export }
WidgetRepresentation >> componentAttributeOn: anExporter [
]

{ #category : #export }
WidgetRepresentation >> componentAttributeOn: anExporter forWidget: aWidget [
	| attributes |
	attributes := self attributeOf: aWidget.
	self exportAttributes: attributes with: anExporter.
	self componentAttributeOn: anExporter
]

{ #category : #export }
WidgetRepresentation >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter.
	self exportContentOf: aWidget with: anExporter.
	self exportFooterOf: aWidget with: anExporter.
]

{ #category : #export }
WidgetRepresentation >> exportAttribute: attribute with: anExporter [
	anExporter <<< (anExporter protectString: attribute attributeValue asString)
]

{ #category : #export }
WidgetRepresentation >> exportAttributes: attributes with: anExporter [
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
WidgetRepresentation >> exportContentOf: aWidget with: anExporter [
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
WidgetRepresentation >> exportFooterOf: aWidget with: anExporter [
	anExporter
		crlf;
		<< '</';
		<<< (aWidget getSelectorFrom: anExporter);
		<<< '>'
]

{ #category : #export }
WidgetRepresentation >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter <<< '>'
]

{ #category : #accessing }
WidgetRepresentation >> getSelector [
	^ 'div'
]

{ #category : #export }
WidgetRepresentation >> importString [
	^ 'import { ' , self moduleName , ' } from ''' , self modulePath , ''';'
]

{ #category : #accessing }
WidgetRepresentation >> internalDependencies [
	^ {  }
]

{ #category : #accessing }
WidgetRepresentation >> isLocal [
	"The widget is NOT imported from a distant library
	It is already part of the exported project"
	^ true
]

{ #category : #accessing }
WidgetRepresentation >> isNative [
	"The widget is part of the html standard"
	^ true
]

{ #category : #accessing }
WidgetRepresentation >> moduleName [
	^ 'ElementRef'
]

{ #category : #accessing }
WidgetRepresentation >> modulePath [
	^ '@angular/core'
]
