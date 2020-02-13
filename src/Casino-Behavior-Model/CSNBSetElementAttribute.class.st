"
set the attribute value of an element accessed
"
Class {
	#name : #CSNBSetElementAttribute,
	#superclass : #FASTJavaMethodInvocation,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBSetElementAttribute class >> annotation [

	<FMClass: #SetElementAttribute super: #FASTJavaMethodInvocation>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBSetElementAttribute >> attribute [
	"Relation named: #attribute type: #CSNAttribute opposite: #behavioralSetAccess"

	<generated>
	<FMProperty: #attribute type: #CSNAttribute opposite: #behavioralSetAccess>
	^ self privateState attributeAt: #attribute ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBSetElementAttribute >> attribute: anObject [

	<generated>
	self privateState attributeAt: #attribute put: (FMMultivalueLink on: self update: #behavioralSetAccess from: self attribute to: anObject).
]
