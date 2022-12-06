Class {
	#name : #CSNVPackage,
	#superclass : #Object,
	#instVars : [
		'vpages',
		'vPackages',
		'model'
	],
	#category : #'Casino-Model-Visualisation-PackagesGroupModule'
}

{ #category : #accessing }
CSNVPackage >> addPackage: aPackage [

	vPackages add: aPackage
]

{ #category : #accessing }
CSNVPackage >> addPage: aPage [
	vpages add: aPage
]

{ #category : #accessing }
CSNVPackage >> allChildren [
	^ { self children . self children flatCollect: #allChildren } flattened
]

{ #category : #accessing }
CSNVPackage >> children [
	^ self vPackages, self vpages
]

{ #category : #accessing }
CSNVPackage >> initialize [
	super initialize.
	vpages := Set new.
	vPackages := Set new.
]

{ #category : #accessing }
CSNVPackage >> model [

	^ model
]

{ #category : #accessing }
CSNVPackage >> model: anObject [

	model := anObject
]

{ #category : #accessing }
CSNVPackage >> vPackages [

	^ vPackages
]

{ #category : #accessing }
CSNVPackage >> vPackages: anObject [

	vPackages := anObject
]

{ #category : #accessing }
CSNVPackage >> vpages [

	^ vpages
]

{ #category : #accessing }
CSNVPackage >> vpages: anObject [

	vpages := anObject
]
