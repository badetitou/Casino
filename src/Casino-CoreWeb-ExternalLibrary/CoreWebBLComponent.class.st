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
	^ 'app/projects/bl-shell/src/lib' , self subModulePath
]

{ #category : #accessing }
CoreWebBLComponent class >> subModulePath [
	^ self subclassResponsibility
]
