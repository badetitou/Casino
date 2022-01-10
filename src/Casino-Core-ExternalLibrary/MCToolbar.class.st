Class {
	#name : #MCToolbar,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCToolbar >> getSelector [
	^ 'mat-toolbar'
]

{ #category : #accessing }
MCToolbar >> moduleName [
	^ 'MatToolbarModule'
]

{ #category : #accessing }
MCToolbar >> modulePath [
	^ '@angular/material/toolbar'
]
