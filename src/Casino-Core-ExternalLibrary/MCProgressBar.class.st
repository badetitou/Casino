Class {
	#name : #MCProgressBar,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCProgressBar class >> getSelector [
	^ 'mat-progress-bar'
]

{ #category : #accessing }
MCProgressBar class >> moduleName [
	^ 'MatProgressBarModule'
]

{ #category : #accessing }
MCProgressBar class >> modulePath [
	^ '@angular/material/progress-bar'
]
