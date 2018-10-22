Class {
	#name : #BLWidgetFactory,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'BL-Model-Importer'
}

{ #category : #factory }
BLWidgetFactory >> createAttributeFrom: anObject [
	^ model add: (BLAttribute perform: self factoryMethodForAttribute withArguments: {anObject}).
]

{ #category : #factory }
BLWidgetFactory >> createWidgetFrom: anObject [
	^ model add: (BLWidget perform: self factoryMethod withArguments: {anObject}).
]

{ #category : #accesing }
BLWidgetFactory >> factoryMethod [
	^ self subclassResponsibility
]

{ #category : #accesing }
BLWidgetFactory >> factoryMethodForAttribute [
	^ self subclassResponsibility
]

{ #category : #accessing }
BLWidgetFactory >> model [
	^ model
]

{ #category : #accessing }
BLWidgetFactory >> model: anObject [
	model := anObject
]
