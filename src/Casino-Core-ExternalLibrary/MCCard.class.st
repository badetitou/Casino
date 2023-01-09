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
	#name : #MCCard,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCCard >> angularActionRepresentationOf: action forWidget: aWidget using: anExporter [

	action isActionAppel ifTrue: [ ^ nil ].
	anExporter <<< (action getAngularRepresentationWith: anExporter)
]

{ #category : #accessing }
MCCard >> attributeOf: aWidget with: anExporter [

	^ (super attributeOf: aWidget with: anExporter) flattened reject: [ :attribute | "Title is used in the header" 
		  attribute isKindOf: CSNUITitle ]
]

{ #category : #export }
MCCard >> exportActionAppel: action with: anExporter [

	anExporter
		indentPlus;
		indent;
		<<< '<i class="ph-file-light" (click)="openPhase(';
		<<< action call getAcceptedName;
		<<< ')"></i>';
		crlf;
		indentMinus
]

{ #category : #export }
MCCard >> exportFooterOf: aWidget with: anExporter [

	(aWidget children reject: [ :child | (child isKindOf: CSNAttribute) or: [ child isKindOf: CSNAction ] ]) isNotEmpty ifTrue: [ 
		anExporter
			crlf;
			<< '</mat-card-content>';
			indentMinus;
			crlf ].
	anExporter
		<< '</';
		<<< (aWidget getSelectorFrom: anExporter);
		<<< '>'
]

{ #category : #export }
MCCard >> exportHeaderOf: aWidget with: anExporter [

	anExporter << '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter <<< '>'.
	anExporter crlf.
	((aWidget attributes anySatisfy: [ :att | att isKindOf: CSNUITitle ]) 
		 or: [ 
			 aWidget actions anySatisfy: [ :action | 
				 action isKindOf: CSNActionAppel ] ]) ifTrue: [ 
		anExporter
			indentPlus;
			<< '<mat-card-header>';
			crlf.

		aWidget attributes
			detect: [ :a | a isOfType: CSNUITitle ]
			ifFound: [ :attribute | 
				anExporter
					indentPlus;
					<< '<mat-card-title>'.
				anExporter visit: attribute.
				anExporter
					<<< '</mat-card-title>';
					indentMinus;
					crlf ].
		(aWidget actions select: [ :action | action isActionAppel ])
			do: [ :action | self exportActionAppel: action with: anExporter ]
			separatedBy: [ anExporter crlf ].
		anExporter
			<< '</mat-card-header>';
			crlf;
			indentMinus ].
	(aWidget children reject: [ :child | 
		 (child isKindOf: CSNAttribute) or: [ child isKindOf: CSNAction ] ])
		isNotEmpty ifTrue: [ 
		anExporter
			indentPlus;
			<< '<mat-card-content>' ]
]

{ #category : #accessing }
MCCard >> getSelector [
	^ 'mat-card'
]

{ #category : #accessing }
MCCard >> moduleName [
	^ 'MatCardModule'
]

{ #category : #accessing }
MCCard >> modulePath [
	^ '@angular/material/card'
]
