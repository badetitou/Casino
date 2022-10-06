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
	#name : #CSNELCWBLFieldsetComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLFieldsetComponent >> angularActionRepresentationOf: action forWidget: aWidget using: anExporter [

	action isActionAppel ifTrue: [ 
		action call ifNil: [ "guard" ^ nil ].
		^ anExporter
			  <<< '(moreDetails)="openPhase(';
			  <<< action call getAcceptedName;
			  <<< ')"' ].
	anExporter <<< (action getAngularRepresentationWith: anExporter)
]

{ #category : #accessing }
CSNELCWBLFieldsetComponent >> attributeOf: aWidget [

	| attributes |
	attributes := super attributeOf: aWidget.
	(aWidget actions anySatisfy: [ :action | action isActionAppel ]) 
		ifTrue: [ 
			attributes := attributes , { (CSNAttribute new
				               name: '[withDetails]';
				               attributeValue: 'true') } ].
	^ attributes
]

{ #category : #accessing }
CSNELCWBLFieldsetComponent >> getSelector [
	^ 'bl-fieldset'
]

{ #category : #accessing }
CSNELCWBLFieldsetComponent >> moduleName [
	^ 'FieldsetComponent'
]

{ #category : #accessing }
CSNELCWBLFieldsetComponent >> subModulePath [
	^ '/components/fieldset/fieldset.component'
]
