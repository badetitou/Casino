Class {
	#name : #MCMenu,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCMenu >> getSelector [
	^ 'mat-menu'
]

{ #category : #accessing }
MCMenu >> moduleName [
	^ 'MatMenuModule'
]

{ #category : #accessing }
MCMenu >> modulePath [
	^ '@angular/material/menu'
]
