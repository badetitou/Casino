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
	self uiModel ifNil: [ ^ self ].
	(self model allWithType: FASTNamedEntity) asOrderedCollection
		select: [ :namedEntity | 
			(self uiModel allCSNService
				select: [ :service | service name = namedEntity name ])
				ifEmpty: [ false ]
				ifNotEmpty: [ :service | 
					(service first actions collect: #name)
						includes: namedEntity parentNode parentNode parentNode name ] ]
		thenDo: [ :namedEntity | 
			| asynchroneCall |
			asynchroneCall := self newAsynchroneCall.
			asynchroneCall parentNode: namedEntity parentNode parentNode parentNode parentNode.
			namedEntity parentNode parentNode parentNode arguments detect: [ :arg | arg class = FASTJavaNewClassExpression ] ifFound: [:newClass | (newClass methods select: [ :m | m name = 'onSuccess' ])
				ifNotEmpty:
					[ :successMethodInCollection | asynchroneCall onSuccess: successMethodInCollection first. successMethodInCollection first parentNode: asynchroneCall ] ] .
			namedEntity parentNode parentNode parentNode arguments detect: [ :arg | arg class = FASTJavaNewClassExpression ] ifFound: [:newClass | (newClass methods select: [ :m | m name = 'onFailure' ])
				ifNotEmpty:
					[ :faillureMethodInCollection | asynchroneCall onFailure: faillureMethodInCollection first. faillureMethodInCollection first parentNode: asynchroneCall ] ].
			asynchroneCall distantService: namedEntity name.
			self model
				removeAll:
					{
					namedEntity parentNode parentNode parentNode.
					namedEntity parentNode parentNode.
					namedEntity parentNode.
					namedEntity.	}.
			namedEntity parentNode parentNode parentNode parentNode childrenNode remove: namedEntity parentNode parentNode parentNode.
			namedEntity parentNode parentNode childrenNode remove: namedEntity parentNode.
			]
]
