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
	#name : #MaterialComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #'accessing - testing' }
MaterialComponent >> isLocal [

	^ false
]

{ #category : #'accessing - testing' }
MaterialComponent >> isNative [
	"The widget is part of the html standard"
	^ false
]

{ #category : #accessing }
MaterialComponent >> moduleName [
	self subclassResponsibility 
]

{ #category : #accessing }
MaterialComponent >> modulePath [
	^ self subclassResponsibility 
]
