Class {
	#name : #BLWidgetFactory,
	#superclass : #Object,
	#category : #'BL-Model-Importer'
}

{ #category : #factory }
BLWidgetFactory class >> createAttributeFrom: anObject [
	^ self new createAttributeFrom: anObject
]

{ #category : #factory }
BLWidgetFactory class >> createWidgetFrom: anObject [
	^ self new createWidgetFrom: anObject
]

{ #category : #factory }
BLWidgetFactory >> createAttributeFrom: anObject [
	^ BLAttribute perform: self factoryMethodForAttribute withArguments: {anObject}.
]

{ #category : #factory }
BLWidgetFactory >> createWidgetFrom: anObject [
	^ BLWidget perform: self factoryMethod withArguments: {anObject}.
]

{ #category : #accesing }
BLWidgetFactory >> factoryMethod [
	^ self subclassResponsibility
]

{ #category : #accesing }
BLWidgetFactory >> factoryMethodForAttribute [
	^ self subclassResponsibility
]
