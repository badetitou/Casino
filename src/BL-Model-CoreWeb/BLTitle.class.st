Class {
	#name : #BLTitle,
	#superclass : #BLNormalAttribute,
	#category : #'BL-Model-CoreWeb-Attribute'
}

{ #category : #testing }
BLTitle class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'title' ]
]

{ #category : #testing }
BLTitle class >> getAttributeValueFrom: anInvocation [
	^ anInvocation parameters at: 1 ifAbsent: [ '' ]
]
