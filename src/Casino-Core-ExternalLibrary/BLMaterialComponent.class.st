Class {
	#name : #BLMaterialComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #testing }
BLMaterialComponent >> isLocal [
	^ false
]

{ #category : #testing }
BLMaterialComponent >> isNative [
	"do we need to import"
	^ false
]

{ #category : #testing }
BLMaterialComponent >> moduleName [

	self subclassResponsibility
]

{ #category : #testing }
BLMaterialComponent >> modulePath [

	^ self subclassResponsibility
]
