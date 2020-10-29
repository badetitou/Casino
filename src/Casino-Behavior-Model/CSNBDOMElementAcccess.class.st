"
Access to a DOM element
"
Class {
	#name : #CSNBDOMElementAcccess,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTReceiver',
	#classTraits : 'FASTJavaTReceiver classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBDOMElementAcccess class >> annotation [

	<FMClass: #DOMElementAcccess super: #FASTExpression>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBDOMElementAcccess >> widget [
	"Relation named: #widget type: #CSNWidget opposite: #behavioralAccess"

	<generated>
	<FMProperty: #widget type: #CSNWidget opposite: #behavioralAccess>
	^ self attributeAt: #widget ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBDOMElementAcccess >> widget: anObject [

	<generated>
	self attributeAt: #widget put: (FMMultivalueLink on: self update: #behavioralAccess from: self widget to: anObject).
]
