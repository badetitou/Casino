"
I am a visitor for CSNAction
"
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
TCSNBehaviorVisitor >> visitCSNAction: aCSNAction [
	^ self subclassResponsibility
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNActionAppel: aCSNActionAppel [
	<generated>
	^ self visitCSNAction: aCSNActionAppel
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNActionService: aCSNActionService [
	<generated>
	^ self visitCSNAction: aCSNActionService
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnBlur: aCSNBOnBlur [
	<generated>
	^ self visitCSNAction: aCSNBOnBlur
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnChange: aCSNBOnChange [
	<generated>
	^ self visitCSNAction: aCSNBOnChange
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnClick: aCSNBOnClick [
	<generated>
	^ self visitCSNAction: aCSNBOnClick
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnDoubleclick: aCSNBOnDoubleclick [
	<generated>
	^ self visitCSNAction: aCSNBOnDoubleclick
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnDrop: aCSNBOnDrop [
	<generated>
	^ self visitCSNAction: aCSNBOnDrop
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnError: aCSNBOnError [
	<generated>
	^ self visitCSNAction: aCSNBOnError
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnFocus: aCSNBOnFocus [
	<generated>
	^ self visitCSNAction: aCSNBOnFocus
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnKeydown: aCSNBOnKeydown [
	<generated>
	^ self visitCSNAction: aCSNBOnKeydown
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnKeypress: aCSNBOnKeypress [
	<generated>
	^ self visitCSNAction: aCSNBOnKeypress
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnKeyup: aCSNBOnKeyup [
	<generated>
	^ self visitCSNAction: aCSNBOnKeyup
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnLoad: aCSNBOnLoad [
	<generated>
	^ self visitCSNAction: aCSNBOnLoad
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnMousemove: aCSNBOnMousemove [
	<generated>
	^ self visitCSNAction: aCSNBOnMousemove
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnMouseout: aCSNBOnMouseout [
	<generated>
	^ self visitCSNAction: aCSNBOnMouseout
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnMouseup: aCSNBOnMouseup [
	<generated>
	^ self visitCSNAction: aCSNBOnMouseup
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnOut: aCSNBOnOut [
	<generated>
	^ self visitCSNAction: aCSNBOnOut
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnOver: aCSNBOnOver [
	<generated>
	^ self visitCSNAction: aCSNBOnOver
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnSubmit: aCSNBOnSubmit [
	<generated>
	^ self visitCSNAction: aCSNBOnSubmit
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCSNBOnSubmitSuccess: aCSNBOnSubmitSuccess [
	<generated>
	^ self visitCSNAction: aCSNBOnSubmitSuccess
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitCall: aCall [
	^ self visitFASTTExpression: aCall
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitDOMElementAcccess: aDOMElementAcccess [
	^ self visitFASTTExpression: aDOMElementAcccess
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitGetElementAttribute: aSetElementAttribute [ 
	^ self visitAccessElementAttribute: aSetElementAttribute
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitNavigation: aNavigation [
	^ self visitFASTTExpression: aNavigation
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitOpenDialog: anOpenDialog [
	^ self visitFASTTExpression: anOpenDialog
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitPopUp: aPopUp [
	^ self visitFASTTExpression: aPopUp
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitSetElementAttribute: aSetElementAttribute [ 
	^ self visitAccessElementAttribute: aSetElementAttribute
]

{ #category : #visiting }
TCSNBehaviorVisitor >> visitSynchroneCall: aSynchroneCall [
	^ self visitCall: aSynchroneCall
]
