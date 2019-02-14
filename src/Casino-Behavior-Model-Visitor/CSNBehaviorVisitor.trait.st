Trait {
	#name : #CSNBehaviorVisitor,
	#category : #'Casino-Behavior-Model-Visitor'
}

{ #category : #visiting }
CSNBehaviorVisitor >> visitAsynchroneCall: anAsynchroneCall [
	^ self visitCall: anAsynchroneCall
]

{ #category : #visiting }
CSNBehaviorVisitor >> visitCall: aCall [
	^ self visitFASTExpression: aCall
]

{ #category : #visiting }
CSNBehaviorVisitor >> visitNavigation: aNavigation [
	^ self visitFASTExpression: aNavigation
]

{ #category : #visiting }
CSNBehaviorVisitor >> visitPopUp: aPopUp [
	^ self visitFASTExpression: aPopUp
]

{ #category : #visiting }
CSNBehaviorVisitor >> visitSynchroneCall: aSynchroneCall [
	^ self visitCall: aSynchroneCall
]
