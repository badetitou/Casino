Class {
	#name : #CSNBehaviorPatternServiceCall,
	#superclass : #CSNBehaviorPattern,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternServiceCall >> createAsynchroneCallFrom: namedEntity withDistantService: action [
	| asynchroneCall |
	asynchroneCall := self newAsynchroneCall.
	asynchroneCall
		startPos: namedEntity parentNode parentNode parentNode startPos;
		endPos: namedEntity parentNode parentNode parentNode endPos.
	namedEntity parentNode parentNode parentNode parentNode expression: asynchroneCall.
	namedEntity parentNode parentNode parentNode arguments
		detect: [ :arg | arg class = FASTJavaNewClassExpression ]
		ifFound: [ :newClass | 
			(newClass declarations select: [ :m | m name = 'onSuccess' ])
				ifNotEmpty: [ :successMethodInCollection | 
					successMethodInCollection first removeAllPotentialParentNode.
					asynchroneCall onSuccess: successMethodInCollection first ] ].
	namedEntity parentNode parentNode parentNode arguments
		detect: [ :arg | arg class = FASTJavaNewClassExpression ]
		ifFound: [ :newClass | 
			(newClass declarations select: [ :m | m name = 'onFailure' ])
				ifNotEmpty: [ :faillureMethodInCollection | 
					faillureMethodInCollection first removeAllPotentialParentNode.
					asynchroneCall onFailure: faillureMethodInCollection first ] ].
	asynchroneCall distantService: action.
	self model removeAll: {namedEntity parentNode parentNode parentNode . namedEntity parentNode parentNode . namedEntity parentNode . namedEntity}
]

{ #category : #'instance creation' }
CSNBehaviorPatternServiceCall >> newAsynchroneCall [
	^ self model add: CSNBAsynchroneCall new
]

{ #category : #'instance creation' }
CSNBehaviorPatternServiceCall >> newSynchroneCall [
	^ self model add: CSNBSynchroneCall new
]

{ #category : #running }
CSNBehaviorPatternServiceCall >> run [

	self uiModel ifNil: [ ^ self ].
	(self model allWithType: FASTJavaVariableExpression) asOrderedCollection do: [ :namedEntity | 
		self uiModel allCSNService asOrderedCollection
			detect: [ :service | service source name = namedEntity name ]
			ifFound: [ :service | 
				service actions
					select: [ :action | 
						namedEntity parentNode isNotNil and: [ 
							namedEntity parentNode parentNode isNotNil and: [ 
								namedEntity parentNode parentNode parentNode isNotNil and: [ 
									action name = namedEntity parentNode parentNode parentNode name and: [ namedEntity parentNode parentNode parentNode parentNode isNotNil ] ] ] ] ]
					thenDo: [ :action | self createAsynchroneCallFrom: namedEntity withDistantService: action ] ] ]
]
