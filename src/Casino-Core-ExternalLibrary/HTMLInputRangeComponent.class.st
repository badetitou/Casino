Class {
	#name : #HTMLInputRangeComponent,
	#superclass : #HTMLInputComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
HTMLInputRangeComponent >> componentAttributeOn: anExporter [
	anExporter <<< ' type="range" '
]
