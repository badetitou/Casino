Class {
	#name : #CSNUICWExtendedLink,
	#superclass : #CSNUILink,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWExtendedLink class >> annotation [

	<FMClass: #ExtendedLink super: #CSNUILink>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #adding }
CSNUICWExtendedLink >> addAdditionalAction: anObject [
	<generated>
	^ self additionalActions add: anObject
]

{ #category : #accessing }
CSNUICWExtendedLink >> additionalActions [
	"Relation named: #additionalActions type: #CSNAction opposite: #linkExtended"

	<generated>
	<derived>
	<FMProperty: #additionalActions type: #CSNAction opposite: #linkExtended>
	^ self attributeAt: #additionalActions ifAbsentPut: [ FMMultivalueLink on: self opposite: #linkExtended: ]
]

{ #category : #accessing }
CSNUICWExtendedLink >> additionalActions: anObject [

	<generated>
	self additionalActions value: anObject
]
