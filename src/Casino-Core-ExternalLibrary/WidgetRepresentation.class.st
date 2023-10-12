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
				eol;
				indentPlus.
			anExporter
				visit: widget;
				indentMinus ]
]

{ #category : #export }
WidgetRepresentation >> exportFooterOf: aWidget with: anExporter [
	anExporter
		eol;
		<< '</';
		<<< (self getSelector);
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

	anExporter <<< self getSelector.
	self componentAttributeOn: anExporter forWidget: aWidget.
	self componentActionsOn: anExporter forWidget: aWidget
	"anExporter <<< aWidget idTag"
]

{ #category : #'export - typescript' }
WidgetRepresentation >> exportTypeScriptConstructorInjectionOf: widget usingExporter: anExporter [
	"I export in the TS injection in the constructor for my widget"
]

{ #category : #'export - typescript' }
WidgetRepresentation >> exportTypeScriptImportOf: widget usingExporter: anExporter [
	"I export in the TS component of my widget the variables required for its proper working"
]

{ #category : #'export - typescript' }
WidgetRepresentation >> exportTypeScriptMethodsOf: widget usingExporter: anExporter [
	"I export in the TS component of my widget the variables required for its proper working"
]

{ #category : #'export - typescript' }
WidgetRepresentation >> exportTypeScriptOnDestroyOf: widget usingExporter: anExporter [

	"I export in the TS code inside ngOnInit of my widget.
	It is often about inizializing some attributes"

	
]

{ #category : #'export - typescript' }
WidgetRepresentation >> exportTypeScriptOnInitOf: widget usingExporter: anExporter [

	"I export in the TS code inside ngOnInit of my widget.
	It is often about inizializing some attributes"

	
]

{ #category : #'export - typescript' }
WidgetRepresentation >> exportTypeScriptVariableOf: widget usingExporter: anExporter [
	"I export in the TS component of my widget the variables required for its proper working"
]

{ #category : #'accessing - form' }
WidgetRepresentation >> extractFormContainerOf: aWidget with: anExporter [

	^ ((aWidget
		    allAtScope: CSNWidget
		    until: [ :w | 
		    (anExporter angularRepresentationOf: w) isFormContainer ]) 
		   select: [ :w | 
		   (anExporter angularRepresentationOf: w) isFormContainer ]) anyOne
]

{ #category : #accessing }
WidgetRepresentation >> getSelector [
	^ 'div'
]

{ #category : #accessing }
WidgetRepresentation >> getSubWidgets: aWidget usingExporter: anExporter [

	^ (aWidget widgets , (aWidget isContainer ifTrue: [ aWidget layout
		    ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ]
		    ifNil: [ {  } ]]ifFalse:[{}]) reject: [ :el | el = aWidget ]) reject: [ :w | 
		  (anExporter angularRepresentationOf: w) isSubComponent ]
]

{ #category : #'accessing - export' }
WidgetRepresentation >> getTypeScriptExtendsRequiredBy: widget usingExporter: anExporter [

	"I return the list of extend of the root component this representation need.
	If multiple component in the same DOM tree have this set to something, it might create huge problem"

	^ {  }
]

{ #category : #'accessing - export' }
WidgetRepresentation >> getTypeScriptSuperRequiredBy: widget usingExporter: anExporter [

	"I return the list of super() of the root component this representation need.
	If multiple component in the same DOM tree have this set to something, it might create huge problem"

	^ {  }
]

{ #category : #'export - typescript' }
WidgetRepresentation >> importString [
	^ 'import { ' , self moduleName , ' } from ''' , self modulePath , ''';'
]

{ #category : #'export - typescript' }
WidgetRepresentation >> importStringOf: aWidget [

	^ self importString
]

{ #category : #accessing }
WidgetRepresentation >> internalDependenciesOf: aWidgetInstance [

	^ {  }
]

{ #category : #'accessing - form' }
WidgetRepresentation >> isFormContainer [
	"If true this representation support the formControl"
	^ false
]

{ #category : #'accessing - form' }
WidgetRepresentation >> isFormControl [
	"If true this representation support the formControl"
	^ false
]

{ #category : #'accessing - testing' }
WidgetRepresentation >> isLocal [
	"The widget is NOT imported from a distant library
	It is already part of the exported project"
	^ true
]

{ #category : #'accessing - testing' }
WidgetRepresentation >> isNative [
	"The widget is part of the html standard"
	^ true
]

{ #category : #'accessing - testing' }
WidgetRepresentation >> isOverrideLayout [

	"If true this representation ask to bypass the classic export of layout because it deals with it in the `exportContentOf:with:` method "

	^ false
]

{ #category : #'accessing - testing' }
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

{ #category : #accessing }
WidgetRepresentation >> representationSubWidgetsOf: aWidget usingExporter: anExporter [

	"la liste des widgets en dessous du widget courant, filtré si besoin "

	| subs |
	subs := self getSubWidgets: aWidget usingExporter: anExporter.

	^ subs , (subs collect: [ :w | 
		  (anExporter angularRepresentationOf: w)
			  representationSubWidgetsOf: w
			  usingExporter: anExporter ])
]
