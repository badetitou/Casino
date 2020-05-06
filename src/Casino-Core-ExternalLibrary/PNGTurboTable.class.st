Class {
	#name : #PNGTurboTable,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGTurboTable class >> getSelector [
	^ 'p-table'
]

{ #category : #accessing }
PNGTurboTable class >> moduleName [
	^ 'TableModule'
]

{ #category : #accessing }
PNGTurboTable class >> modulePath [
	^ 'primeng/table'
]
