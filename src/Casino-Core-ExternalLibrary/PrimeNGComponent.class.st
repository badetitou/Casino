Class {
	#name : #PrimeNGComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PrimeNGComponent >> isLocal [
	^ false
]

{ #category : #accessing }
PrimeNGComponent >> isNative [
	"The widget is part of the html standard"
	^ false
]

{ #category : #accessing }
PrimeNGComponent >> moduleName [
	self subclassResponsibility 
]

{ #category : #accessing }
PrimeNGComponent >> modulePath [
	^ self subclassResponsibility 
]
