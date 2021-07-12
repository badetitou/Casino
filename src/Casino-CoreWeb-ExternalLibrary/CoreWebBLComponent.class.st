Class {
	#name : #CoreWebBLComponent,
	#superclass : #WidgetRepresentation,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CoreWebBLComponent >> isNative [
	^ false
]

{ #category : #accessing }
CoreWebBLComponent >> modulePath [
	^ 'app/projects/bl-shell/src/lib' , self subModulePath
]

{ #category : #accessing }
CoreWebBLComponent >> subModulePath [
	^ self subclassResponsibility
]
