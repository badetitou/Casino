Class {
	#name : #WidgetDependency,
	#superclass : #Object,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #'as yet unclassified' }
WidgetDependency class >> importString [
	^ self subclassResponsibility 
]

{ #category : #accessing }
WidgetDependency class >> internalDependencies [
	^ {  }
]

{ #category : #accessing }
WidgetDependency class >> moduleName [
	self subclassResponsibility
]
