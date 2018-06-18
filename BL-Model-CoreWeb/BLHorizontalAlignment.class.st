Class {
	#name : #BLHorizontalAlignment,
	#superclass : #BLNormalAttribute,
	#category : #'BL-Model-CoreWeb-Attribute'
}

{ #category : #testing }
BLHorizontalAlignment class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'HorizontalAlignment' ]
]
