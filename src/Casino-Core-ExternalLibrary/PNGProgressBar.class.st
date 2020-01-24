Class {
	#name : #PNGProgressBar,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGProgressBar class >> getSelector [
	^ 'p-progressBar'
]

{ #category : #accessing }
PNGProgressBar class >> moduleName [
	^ 'ProgressBarModule'
]

{ #category : #accessing }
PNGProgressBar class >> modulePath [
	^ 'primeng/progressbar'
]
