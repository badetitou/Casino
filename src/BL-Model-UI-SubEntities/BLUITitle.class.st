"
Here, a title attribute is added to the <p> element. The value of the title attribute will be displayed as a tooltip when you mouse over the paragraph:

It can also be use in other complex widget as the fieldset
"
Class {
	#name : #BLUITitle,
	#superclass : #BLAttribute,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUITitle >> accept: anExporter [
	^ anExporter visitBLUITitle: self
]

{ #category : #accessing }
BLUITitle >> text [
	^ text
]

{ #category : #accessing }
BLUITitle >> text: anObject [
	text := anObject
]
