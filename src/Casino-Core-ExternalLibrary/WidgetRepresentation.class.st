Class {
	#name : #WidgetRepresentation,
	#superclass : #Object,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
WidgetRepresentation >> angularActionRepresentationOf: action forWidget: aWidget using: anExporter [
	^ anExporter <<< (action getAngularRepresentationWith: anExporter)
]

{ #category : #'accessing - export' }
WidgetRepresentation >> attributeDictionary [
	^ {  } asDictionary
]

{ #category : #export }
WidgetRepresentation >> attributeNameInComponent: attribute [
	^ self attributeDictionary at: attribute class ifAbsent: [ attribute name ]
]

{ #category : #export }
WidgetRepresentation >> attributeOf: aWidget with: anExporter [

	| attributes |
	attributes := aWidget computeSelfAttributes.
	attributes addAll: (anExporter
			 additionalAttributesForWidget: aWidget
			 withRepresentation: self).
	aWidget variable ifNotNil: [ :variable | 
		attributes add: (CSNUIId new attributeValue: aWidget id) ].
	^ attributes
]

{ #category : #export }
WidgetRepresentation >> componentActionsOn: anExporter forWidget: aWidget [

	aWidget actions ifNotEmpty: [ 
		anExporter <<< ' '.
		aWidget actions
			do: [ :action | 
				self
					angularActionRepresentationOf: action
					forWidget: aWidget
					using: anExporter ]
			separatedBy: [ anExporter <<< ' ' ] ]
]

{ #category : #export }
WidgetRepresentation >> componentAttributeOn: anExporter [
]

{ #category : #export }
WidgetRepresentation >> componentAttributeOn: anExporter forWidget: aWidget [
	| attributes |
	attributes := self attributeOf: aWidget with: anExporter.
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

	anExporter exportAttributeValue: attribute
	
]

{ #category : #export }
WidgetRepresentation >> exportAttributes: attributes with: anExporter [

	^ ((attributes flattened reject: [ :att | att name isNil ])  
		   groupedBy: [ :attribute | 
		   self attributeNameInComponent: attribute ]) asDictionary 
		  associationsDo: [ :mapAttributeNameValues | 
			  anExporter
				  <<< ' ';
				  <<< mapAttributeNameValues key;
				  <<< '="'.
			  mapAttributeNameValues value asOrderedCollection
				  do: [ :attribute | anExporter visit: attribute ]
				  separatedBy: [ anExporter <<< ' ' ].
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
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter <<< '>'
]

{ #category : #export }
WidgetRepresentation >> exportListPropertiesOf: aWidget asStringWith: anExporter [

	anExporter <<< (aWidget getSelectorFrom: anExporter).
	self componentAttributeOn: anExporter forWidget: aWidget.
	self componentActionsOn: anExporter forWidget: aWidget.
	"anExporter <<< aWidget idTag"
]

{ #category : #export }
WidgetRepresentation >> exportTypeScriptVariableOf: widget usingExporter: anExporter [
	"I export in the TS component of my widget the variables required for its proper working"
]

{ #category : #accessing }
WidgetRepresentation >> getSelector [
	^ 'div'
]

{ #category : #export }
WidgetRepresentation >> importString [
	^ 'import { ' , self moduleName , ' } from ''' , self modulePath , ''';'
]

{ #category : #export }
WidgetRepresentation >> importStringOf: aWidget [

	^ self importString
]

{ #category : #accessing }
WidgetRepresentation >> internalDependenciesOf: aWidgetInstance [
	^ {  }
]

{ #category : #accessing }
WidgetRepresentation >> isFormControl [
	"If true this representation support the formControl"
	^ false
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
WidgetRepresentation >> isSubComponent [
	"If true this representation will be exported as a component"
	^ false
]

{ #category : #accessing }
WidgetRepresentation >> moduleName [
	^ 'ElementRef'
]

{ #category : #accessing }
WidgetRepresentation >> modulePath [
	^ '@angular/core'
]
