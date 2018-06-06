Class {
	#name : #BLInputText,
	#superclass : #BLInput,
	#instVars : [
		'text',
		'value'
	],
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLInputText class >> annotation [
	<MSEClass: #BLInputText super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #testing }
BLInputText >> getDom [
	^ '<input id="float-' , self mooseID asString , '" type="text" value="' , value
		,
			'" placeholder="', text,'" pInputText>'
]

{ #category : #accessing }
BLInputText >> getExternalDependency [
	^ {PNGInputText}
]

{ #category : #testing }
BLInputText >> text: aString [
	text := aString
]

{ #category : #testing }
BLInputText >> valueLabel: aString [
	value := aString 
]
