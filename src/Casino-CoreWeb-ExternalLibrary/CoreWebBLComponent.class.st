Class {
	#name : #CoreWebBLComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CoreWebBLComponent class >> isNative [
	^ false
]

{ #category : #accessing }
CoreWebBLComponent class >> modulePath [
	^ 'app/components/components/' , self subModulePath
]

{ #category : #accessing }
CoreWebBLComponent class >> subModulePath [
	^ self subclassResponsibility
]
