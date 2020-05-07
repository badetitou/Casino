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
TCSNBehaviorVisitor >> visitCSNBOnChange: aCSNBOnChange [
	"see UI model"
	^ self visitCSNAction: aCSNBOnChange
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnClick: aCSNBOnClick [
	"see UI model"
	^ self visitCSNAction: aCSNBOnClick
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnError: aCSNBOnError [
	"see UI model"
	^ self visitCSNAction: aCSNBOnError
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnSubmit: aCSNBOnSubmit [
	"see UI model"
	^ self visitCSNAction: aCSNBOnSubmit
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnSubmitSuccess: aCSNBOnSubmitSuccess [
	"see UI model"
	^ self visitCSNAction: aCSNBOnSubmitSuccess
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
