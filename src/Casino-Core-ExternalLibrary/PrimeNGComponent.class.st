Class {
	#name : #PrimeNGComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PrimeNGComponent class >> isLocal [
	^ false
]

{ #category : #accessing }
PrimeNGComponent class >> isNative [
	"The widget is part of the html standard"
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
