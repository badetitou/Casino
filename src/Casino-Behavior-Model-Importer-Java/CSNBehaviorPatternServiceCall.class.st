Class {
	#name : #CSNBehaviorPatternServiceCall,
	#superclass : #CSNBehaviorPattern,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #'instance creation' }
CSNBehaviorPatternServiceCall >> newAsynchroneCall [
	^ self model silentlyAdd: CSNBAsynchroneCall new
]

{ #category : #'instance creation' }
CSNBehaviorPatternServiceCall >> newSynchroneCall [
	^ self model silentlyAdd: CSNBSynchroneCall new
]

{ #category : #running }
CSNBehaviorPatternServiceCall >> run [
	self todo: #todo.
	self error.
]
