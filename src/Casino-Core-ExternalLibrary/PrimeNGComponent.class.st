Class {
	#name : #PrimeNGComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PrimeNGComponent class >> isLocal [
	"The widget is NOT imported from a distant library
	It is already part of the exported project"
	^ false
]

{ #category : #accessing }
PrimeNGComponent class >> moduleName [
	self subclassResponsibility 
]

{ #category : #accessing }
PrimeNGComponent class >> modulePath [
	^ self subclassResponsibility 
]
