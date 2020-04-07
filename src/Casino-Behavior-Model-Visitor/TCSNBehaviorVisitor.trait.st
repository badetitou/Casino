Trait {
	#name : #TCSNBehaviorVisitor,
	#category : #'Casino-Behavior-Model-Visitor'
}

{ #category : #visiting }
TCSNBehaviorVisitor >> visitAccessElementAttribute: aSetElementAttribute [ 
	^ self visitFASTJavaMethodInvocation: aSetElementAttribute
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitAsynchroneCall: anAsynchroneCall [
	^ self visitCall: anAsynchroneCall
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCall: aCall [
	^ self visitFASTExpression: aCall
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitDOMElementAcccess: aDOMElementAcccess [
	^ self visitFASTExpression: aDOMElementAcccess
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitGetElementAttribute: aSetElementAttribute [ 
	^ self visitAccessElementAttribute: aSetElementAttribute
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitNavigation: aNavigation [
	^ self visitFASTExpression: aNavigation
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitOpenDialog: anOpenDialog [
	^ self visitFASTExpression: anOpenDialog
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitPopUp: aPopUp [
	^ self visitFASTExpression: aPopUp
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitSetElementAttribute: aSetElementAttribute [ 
	^ self visitAccessElementAttribute: aSetElementAttribute
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitSynchroneCall: aSynchroneCall [
	^ self visitCall: aSynchroneCall
]
