Class {
	#name : #MCProgressBar,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCProgressBar >> getSelector [
	^ 'mat-progress-bar'
]

{ #category : #accessing }
MCProgressBar >> moduleName [
	^ 'MatProgressBarModule'
]

{ #category : #accessing }
MCProgressBar >> modulePath [
	^ '@angular/material/progress-bar'
]
