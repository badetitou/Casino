Class {
	#name : #MCRadioButton,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCRadioButton >> componentAttributeOn: anExporter [
	anExporter <<< ' type="radio" '
]

{ #category : #export }
MCRadioButton >> exportContentOf: aWidget with: anExporter [
	aWidget attributes detect: [ :att | att isOfType: CSNUILabel ] ifFound: [ :att | anExporter visit: att ]
]

{ #category : #accessing }
MCRadioButton >> getSelector [
	^ 'mat-radio-button'
]

{ #category : #accessing }
MCRadioButton >> moduleName [
	^ 'MatRadioModule'
]

{ #category : #accessing }
MCRadioButton >> modulePath [
	^ '@angular/material/radio'
]
