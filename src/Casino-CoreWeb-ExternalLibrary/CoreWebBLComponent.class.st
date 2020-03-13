Class {
	#name : #CoreWebBLComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #'as yet unclassified' }
CoreWebBLComponent class >> isNative [
	^ false
]

{ #category : #'as yet unclassified' }
CoreWebBLComponent class >> modulePath [
	^ 'app/components/components/' , self subModulePath
]

{ #category : #'as yet unclassified' }
CoreWebBLComponent class >> subModulePath [
	^ self subclassResponsibility
]
