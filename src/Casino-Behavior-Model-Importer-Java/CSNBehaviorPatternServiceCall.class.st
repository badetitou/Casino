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
	(self model allWithType: FASTNamedEntity)
		select: [ :namedEntity | 
			(self uiModel allCSNService
				select: [ :service | service name = namedEntity name ])
				ifEmpty: [ false ]
				ifNotEmpty: [ :service | (service first actions collect: #name) includes: namedEntity parentNode parentNode parentNode name ] ]	
		thenDo: [:namedEntity | | asynchroneCall |
			asynchroneCall := self newAsynchroneCall.
			self halt.
			namedEntity parentNode parentNode childrenNode add: asynchroneCall.
			namedEntity parentNode parentNode childrenNode remove: namedEntity parentNode.
			self model removeAll: { namedEntity. namedEntity parentNode. namedEntity parentNode parentNode. namedEntity parentNode parentNode parentNode }
			]
]
