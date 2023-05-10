Class {
	#name : #MCDialog,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCDialog >> export: aWidget with: anExporter [
	anExporter generateAsSubComponent: aWidget
]

{ #category : #accessing }
MCDialog >> getSelector [
	^ 'div'
]

{ #category : #accessing }
MCDialog >> isSubComponent [

	^ true
]

{ #category : #accessing }
MCDialog >> moduleName [
	^ 'MatDialogModule'
]

{ #category : #accessing }
MCDialog >> modulePath [
	^ '@angular/material/dialog'
]
