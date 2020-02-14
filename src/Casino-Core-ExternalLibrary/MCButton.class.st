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
	#name : #MCButton,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCButton class >> componentAttributeOn: anExporter [
	anExporter <<< ' mat-stroked-button '
]

{ #category : #accessing }
MCButton class >> getSelector [
	^ 'button'
]

{ #category : #accessing }
MCButton class >> isNative [
	^ true
]

{ #category : #accessing }
MCButton class >> moduleName [
	^ 'MatButtonModule'
]

{ #category : #accessing }
MCButton class >> modulePath [
	^ '@angular/material/button'
]
