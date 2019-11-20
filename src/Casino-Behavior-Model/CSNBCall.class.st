"
I represent an abstract call to a distant service
	
Since I'm abstract, I should not be instanciate (but, it is a reasonnable solution if you don't know witch call instanciate)
"
Class {
	#name : #CSNBCall,
	#superclass : #FASTExpression,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBCall class >> annotation [

	<FMClass: #Call super: #FASTExpression>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBCall >> onFailure [
	"Relation named: #onFailure type: #FASTBehaviouralEntity opposite: #carrefourOnFailureOwner"

	<generated>
	<FMComment: 'The statement executed if the call return ''ko'''>
	<FMProperty: #onFailure type: #FASTBehaviouralEntity opposite: #carrefourOnFailureOwner>
	^ self privateState attributeAt: #onFailure ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBCall >> onFailure: anObject [

	<generated>
	(self privateState attributeAt: #onFailure ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self onFailure.
		self privateState attributeAt: #onFailure put: anObject.
		otherSide carrefourOnFailureOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #onFailure put: anObject.
		anObject carrefourOnFailureOwner: self ]
]

{ #category : #navigation }
CSNBCall >> onFailureGroup [
	<generated>
	<navigation: 'OnFailure'>
	^ MooseGroup with: self onFailure
]

{ #category : #accessing }
CSNBCall >> onSuccess [
	"Relation named: #onSuccess type: #FASTBehaviouralEntity opposite: #carrefourOnSuccessOwner"

	<generated>
	<FMComment: 'The statement executed if the call return ''ok'''>
	<FMProperty: #onSuccess type: #FASTBehaviouralEntity opposite: #carrefourOnSuccessOwner>
	^ self privateState attributeAt: #onSuccess ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBCall >> onSuccess: anObject [

	<generated>
	(self privateState attributeAt: #onSuccess ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self onSuccess.
		self privateState attributeAt: #onSuccess put: anObject.
		otherSide carrefourOnSuccessOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #onSuccess put: anObject.
		anObject carrefourOnSuccessOwner: self ]
]

{ #category : #navigation }
CSNBCall >> onSuccessGroup [
	<generated>
	<navigation: 'OnSuccess'>
	^ MooseGroup with: self onSuccess
]
