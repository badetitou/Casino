Class {
	#name : #MCDialog,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCDialog >> getSelector [
	^ 'div'
]

{ #category : #accessing }
MCDialog >> moduleName [
	^ 'MatDialogModule'
]

{ #category : #accessing }
MCDialog >> modulePath [
	^ '@angular/material'
]
