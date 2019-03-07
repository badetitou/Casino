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
		parentNode: namedEntity parentNode parentNode parentNode parentNode.
	namedEntity parentNode parentNode parentNode arguments
		detect: [ :arg | arg class = FASTJavaNewClassExpression ]
		ifFound: [ :newClass | 
			(newClass methods
				select: [ :m | m childrenNode first name = 'onSuccess' ])
				ifNotEmpty: [ :successMethodInCollection | 
					asynchroneCall onSuccess: successMethodInCollection first.
					successMethodInCollection first parentNode: asynchroneCall ] ].
	namedEntity parentNode parentNode parentNode arguments
		detect: [ :arg | arg class = FASTJavaNewClassExpression ]
		ifFound: [ :newClass | 
			(newClass methods
				select: [ :m | m childrenNode first name = 'onFailure' ])
				ifNotEmpty: [ :faillureMethodInCollection | 
					asynchroneCall onFailure: faillureMethodInCollection first.
					faillureMethodInCollection first parentNode: asynchroneCall ] ].
	asynchroneCall distantService: action.
	self model
		removeAll:
			{namedEntity parentNode parentNode parentNode.
			namedEntity parentNode parentNode.
			namedEntity parentNode.
			namedEntity}.
	namedEntity parentNode parentNode parentNode parentNode childrenNode
		remove: namedEntity parentNode parentNode parentNode.
	^ namedEntity parentNode parentNode childrenNode
		remove: namedEntity parentNode
]

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
	self uiModel ifNil: [ ^ self ].
	(self model allWithType: FASTNamedEntity) asOrderedCollection
		do: [ :namedEntity | 
			(self uiModel allCSNService
				select: [ :service | service name = namedEntity name ])
				ifEmpty: [ false ]
				ifNotEmpty: [ :service | 
					service first actions
						select: [ :action | 
							namedEntity parentNode isNotNil
								and: [ namedEntity parentNode parentNode isNotNil
										and: [ namedEntity parentNode parentNode parentNode isNotNil
												and:
													[ action name = namedEntity parentNode parentNode parentNode name ] ] ] ]
						thenDo:
							[ :action | self createAsynchroneCallFrom: namedEntity withDistantService: action ] ] ]
]
