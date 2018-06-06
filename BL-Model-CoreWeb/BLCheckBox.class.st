Class {
	#name : #BLCheckBox,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLCheckBox class >> annotation [
	<MSEClass: #CheckBox super: #BLWidget>
	<package: #'BL-Model'>
	^ self
]

{ #category : #accessing }
BLCheckBox >> getDom [
	^ '<' ,  self getListPropertiesAsString , ' />'
]

{ #category : #accessing }
BLCheckBox >> getSelector [
	^ 'input'
]
