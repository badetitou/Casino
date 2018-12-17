Class {
	#name : #PrimeNGComponent,
	#superclass : #WidgetDependency,
	#category : #'BL-Model-CoreWeb-Dependency'
}

{ #category : #'as yet unclassified' }
PrimeNGComponent class >> importString [
	^ 'import { ' , self moduleName , ' } from ''' , self modulePath , ''';'
]

{ #category : #accessing }
PrimeNGComponent class >> moduleName [
	self subclassResponsibility 
]

{ #category : #accessing }
PrimeNGComponent class >> modulePath [
	^ self subclassResponsibility 
]
