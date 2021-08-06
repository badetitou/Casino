Extension { #name : #FASTTExpression }

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTTExpression >> carrefourPopUpOwner [
	"Relation named: #carrefourPopUpOwner type: #CSNBPopUp opposite: #data"

	<generated>
	<container>
	<derived>
	<FMProperty: #carrefourPopUpOwner type: #CSNBPopUp opposite: #data>
	<package: #'Casino-Behavior-Model'>
	^ self attributeAt: #carrefourPopUpOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTTExpression >> carrefourPopUpOwner: anObject [

	<generated>
	(self attributeAt: #carrefourPopUpOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self carrefourPopUpOwner.
		self attributeAt: #carrefourPopUpOwner put: anObject.
		otherSide data: nil ]
	ifNotNil: [ 
		self attributeAt: #carrefourPopUpOwner put: anObject.
		anObject data: self ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTTExpression >> navigation [
	"Relation named: #navigation type: #CSNBNavigation opposite: #arguments"

	<generated>
	<container>
	<FMProperty: #navigation type: #CSNBNavigation opposite: #arguments>
	<package: #'Casino-Behavior-Model'>
	^ self attributeAt: #navigation ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTTExpression >> navigation: anObject [

	<generated>
	self attributeAt: #navigation put: (FMMultivalueLink on: self update: #arguments from: self navigation to: anObject).
]
