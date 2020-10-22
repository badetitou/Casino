"
access the attribute value of an element accessed
"
Class {
	#name : #CSNBAccessElementAttribute,
	#superclass : #FASTJavaMethodInvocation,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBAccessElementAttribute class >> annotation [

	<FMClass: #AccessElementAttribute super: #FASTJavaMethodInvocation>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBAccessElementAttribute >> attribute [
	"Relation named: #attribute type: #CSNAttribute opposite: #behavioralAccess"

	<generated>
	<FMProperty: #attribute type: #CSNAttribute opposite: #behavioralAccess>
	^ self attributeAt: #attribute ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBAccessElementAttribute >> attribute: anObject [
	<generated>
	self
		attributeAt: #attribute
		put:
			(FMMultivalueLink
				on: self
				update: #behavioralAccess
				from: self attribute
				to: anObject)
]
