Class {
	#name : #CSNWidgetFactory,
	#superclass : #Object,
	#instVars : [
		'model',
		'importer'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #accessing }
CSNWidgetFactory >> create: anEntity [
	"Use me to create an entity and add it direclty in the model
	
	If you use only me, we're sure to not forget adding entities in the model"
	^ self model silentlyAdd: anEntity new
]

{ #category : #accessing }
CSNWidgetFactory >> importer: anObject [
	importer := anObject
]

{ #category : #accessing }
CSNWidgetFactory >> model [
	^ model
]

{ #category : #accessing }
CSNWidgetFactory >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CSNWidgetFactory >> uiModel [
	^ importer
]
