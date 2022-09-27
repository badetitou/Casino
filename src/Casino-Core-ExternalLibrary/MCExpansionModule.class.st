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
	#name : #MCExpansionModule,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCExpansionModule >> exportContentOf: aWidget with: anExporter [

	anExporter indentPlus.
	aWidget widgets do: [ :widget | 
		anExporter
			crlf;
			<< '<mat-expansion-panel>'.
		anExporter inIndented: [ 
			anExporter << '<mat-expansion-panel-header>'.
			anExporter inIndented: [ 
				anExporter
					<< '<mat-panel-title>';
					indentPlus;
					crlf.
				widget attributes
					detect: [ :a | a isOfType: CSNUITitle ]
					ifFound: [ :attribute | 
						anExporter indent.
						anExporter visit: attribute ]
					ifNone: [ anExporter << 'Please complete title' ].
				anExporter
					indentMinus;
					crlf;
					<< '</mat-panel-title>' ].
			anExporter
				<< '</mat-expansion-panel-header>';
				crlf.
			anExporter visit: widget ].
		anExporter << '</mat-expansion-panel>' ].

	anExporter crlf.
	anExporter indentMinus
]

{ #category : #accessing }
MCExpansionModule >> getSelector [
	^ 'mat-accordion'
]

{ #category : #accessing }
MCExpansionModule >> moduleName [
	^ 'MatExpansionModule'
]

{ #category : #accessing }
MCExpansionModule >> modulePath [
	^ '@angular/material/expansion'
]
