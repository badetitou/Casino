Class {
	#name : #MCRadioButton,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCRadioButton class >> getSelector [
	^ 'mat-radio-button'
]

{ #category : #accessing }
MCRadioButton class >> moduleName [
	^ 'MatRadioModule'
]

{ #category : #accessing }
MCRadioButton class >> modulePath [
	^ '@angular/material/radio'
]
