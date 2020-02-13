"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CSNModelCanHandleSetAttributeCoreWebVisitor,
	#superclass : #CSNModelImporterVisitor,
	#category : #'Casino-Model-CoreWeb-Importer-Visitor'
}

{ #category : #private }
CSNModelCanHandleSetAttributeCoreWebVisitor >> canBeCSNUIHeight [
	^ source isInvocation and: [ source signature beginsWith: 'setHeight' ]
]

{ #category : #private }
CSNModelCanHandleSetAttributeCoreWebVisitor >> canBeCSNUIWidth [
	^ source isInvocation and: [ source signature beginsWith: 'setWidth' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> getAttributeValueFrom: anInvocation [
	^ anInvocation parameters first
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNAttribute: aCSNAttribute [
	<generated>
	^ false
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIHeight and: [ 
		  (self getAttributeValueFrom: source) endsWith: 'px' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIWidth and: [ 
		  (self getAttributeValueFrom: source) endsWith: 'px' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUICWCoreCellWidth: aCSNCoreCellWidth [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	^ (source isInvocation and: [ source attributeName = 'cellwidth' ])
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUICWCoreColSpan: aCSNCoreColSpan [
	^ source isInvocation and: [ source attributeName = 'colspan' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUICWCoreHorizontalAlignement: aCSNCoreHorizontalAlignement [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	^ source isInvocation and: [ 
		  source attributeName = 'horizontalalignment' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUICWCoreRowSpan: aCSNCoreRowSpan [
	^ source isInvocation and: [ source attributeName = 'rowspan' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUICWCoreVerticalAlignement: aCSNCoreVerticalAlignement [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	^ source isInvocation and: [ 
		  source attributeName = 'verticalalignment' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUICWOpen: aCSOpen [
	^ source isInvocation and: [ source attributeName = 'open' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIDisabled: aCSNUIDisabled [
	^ source isInvocation and: [ source attributeName = 'enabled' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIHeight: aCSNUIHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIHeight
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIMaxlength: aCSNUIMaxlength [
	^ source isInvocation and: [ 
		  source signature beginsWith: 'setMaxLength' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIHeight and: [ 
		  (self getAttributeValueFrom: source) endsWith: '%' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIWidth and: [ 
		  (self getAttributeValueFrom: source) endsWith: '%' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUISize: aCSNUISize [
	^ source isInvocation and: [ source signature beginsWith: 'setSize' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUITitle: aCSNUITitle [
	^ source isInvocation and: [ source signature beginsWith: 'setTitle' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIVisibility: aCSNUIVisibility [
	^ source isInvocation and: [ source signature beginsWith: 'setVisible' ]
]

{ #category : #api }
CSNModelCanHandleSetAttributeCoreWebVisitor >> visitCSNUIWidth: aCSNUIWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIWidth
]
