Class {
	#name : #CSNBehaviorModelExporter,
	#superclass : #FASTJavaVisitor,
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

{ #category : #visitor }
CSNBehaviorModelExporter >> visitAsynchroneCall: aCall [
	^ self visitCall: aCall
]

{ #category : #visitor }
CSNBehaviorModelExporter >> visitCall: aCall [
	^ self subclassResponsibility
]

{ #category : #visitor }
CSNBehaviorModelExporter >> visitNavigation: aNavigation [
	^ self subclassResponsibility
]

{ #category : #visitor }
CSNBehaviorModelExporter >> visitPopUp: aPopUp [
	^ self subclassResponsibility
]

{ #category : #visitor }
CSNBehaviorModelExporter >> visitSynchroneCall: aCall [
	^ self visitCall: aCall
]
