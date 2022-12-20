Class {
	#name : #CSNVNode,
	#superclass : #HNode,
	#instVars : [
		'propertiesDic'
	],
	#category : #'Casino-Model-Visualisation-Modules-Card'
}

{ #category : #initialization }
CSNVNode >> initialize [
	super initialize.
	propertiesDic := Dictionary new
]

{ #category : #accessing }
CSNVNode >> propertiesDic [

	^ propertiesDic
]

{ #category : #accessing }
CSNVNode >> propertiesDic: anObject [

	propertiesDic := anObject
]
