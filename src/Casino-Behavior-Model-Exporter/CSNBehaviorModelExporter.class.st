Class {
	#name : #CSNBehaviorModelExporter,
	#superclass : #FASTJavaVisitor,
	#traits : 'TCSNBehaviorVisitor',
	#classTraits : 'TCSNBehaviorVisitor classTrait',
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
