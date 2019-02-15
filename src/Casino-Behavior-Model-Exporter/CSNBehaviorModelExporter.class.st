Class {
	#name : #CSNBehaviorModelExporter,
	#superclass : #Object,
	#traits : 'CSNBehaviorVisitor + FASTVisitor',
	#classTraits : 'CSNBehaviorVisitor classTrait + FASTVisitor classTrait',
	#category : #'Casino-Behavior-Model-Exporter'
}

{ #category : #actions }
CSNBehaviorModelExporter class >> export: aBehaviorModel [
	^ self new export: aBehaviorModel
]

{ #category : #visitor }
CSNBehaviorModelExporter >> export: aBehaviorMethod [
	^ self accept: aBehaviorMethod
]
