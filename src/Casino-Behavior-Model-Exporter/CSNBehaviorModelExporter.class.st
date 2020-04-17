Class {
	#name : #CSNBehaviorModelExporter,
	#superclass : #FASTJavaVisitor,
	#traits : 'TCSNBehaviorVisitor + TCSNExporter',
	#classTraits : 'TCSNBehaviorVisitor classTrait + TCSNExporter classTrait',
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
