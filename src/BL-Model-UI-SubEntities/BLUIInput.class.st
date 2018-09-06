Class {
	#name : #BLUIInput,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInput class >> annotation [
	<MSEClass: #BLUIInput super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #testing }
BLUIInput class >> canHandle: anInvocation [
	^ false
]
