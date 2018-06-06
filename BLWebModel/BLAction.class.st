Class {
	#name : #BLAction,
	#superclass : #FAMIXAssociation,
	#instVars : [
		'call',
		'appelant'
	],
	#category : 'BLWebModel'
}

{ #category : #meta }
BLAction class >> annotation [
	<MSEClass: #BLAction super: #FAMIXAssociation>
	<package: #BLWebModel>
	^ self
]

{ #category : #'instance creation' }
BLAction >> from [
	^ appelant
]

{ #category : #'instance creation' }
BLAction >> from: aBLWidget [
	appelant := aBLWidget
]
