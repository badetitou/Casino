Class {
	#name : #MCRadioButton,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCRadioButton class >> componentAttributeOn: anExporter [
	anExporter <<< ' type="radio" '
]

{ #category : #export }
MCRadioButton class >> exportContentOf: aWidget with: anExporter [
	aWidget attributes detect: [ :att | att isOfType: CSNUILabel ] ifFound: [ :att | anExporter visit: att ]
]

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
