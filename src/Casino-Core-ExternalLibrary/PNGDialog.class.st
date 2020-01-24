Class {
	#name : #PNGDialog,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGDialog class >> getSelector [
	^ 'p-dialog'
]

{ #category : #accessing }
PNGDialog class >> moduleName [
	^ 'DialogModule'
]

{ #category : #accessing }
PNGDialog class >> modulePath [
	^ 'primeng/dialog'
]
