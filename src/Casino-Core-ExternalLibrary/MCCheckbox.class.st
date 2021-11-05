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
	#name : #MCCheckbox,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCCheckbox >> attributeOf: aWidget [

	^ aWidget computeSelfAttributes reject: [ :attribute | "Label are used in the content" 
		  attribute isKindOf: CSNUILabel ]
]

{ #category : #accessing }
MCCheckbox >> exportContentOf: aWidget with: anExporter [
	aWidget attributes detect: [ :att | att isOfType: CSNUILabel ] ifFound: [ :att | anExporter visit: att ]
]

{ #category : #accessing }
MCCheckbox >> getSelector [
	^ 'mat-checkbox'
]

{ #category : #accessing }
MCCheckbox >> moduleName [
	^ 'MatCheckboxModule'
]

{ #category : #accessing }
MCCheckbox >> modulePath [
	^ '@angular/material/checkbox'
]
