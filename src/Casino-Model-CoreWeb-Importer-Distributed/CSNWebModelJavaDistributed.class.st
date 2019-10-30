Class {
	#name : #CSNWebModelJavaDistributed,
	#superclass : #CSNWebModelJava,
	#instVars : [
		'port'
	],
	#category : #'Casino-Model-CoreWeb-Importer-Distributed'
}

{ #category : #'private-actions' }
CSNWebModelJavaDistributed >> generateWidget [
	| data |
	self halt. 
	Smalltalk saveSession.
	
	data := port distribute: (model allWithType: CSNPage) asOrderedCollection .
	data := port distribute: (Object allSubclasses ).
	data := data map: [ :a | a * 2 ].
	data getCollection 
	
	self openDistributedUi.
	
	data := port distribute: ((self widgetConstructorsInvocation , self widgetAnonymousSubclasses , self widgetFactoryInvocation) asSet
		reject: [ :invocationOrClass | (self widgetNamespace match: invocationOrClass from mooseName) or: [ '*noname#super*' match: invocationOrClass asString ] ]).
		
	data := data map: [ :invocation | 
			| blWidget |
			blWidget := self factoryCreateWidgetFrom: invocation.
			blWidget affectedActions: invocation affectation.
			(blWidget affectedActions isNotNil and: [ blWidget affectedActions isInvocation not ]) ifTrue: [ blWidget name: blWidget affectedActions name ].
			blWidget ].
	data getCollection.
]

{ #category : #'private-actions' }
CSNWebModelJavaDistributed >> initialize [
	super initialize.
	port :=  PortRemoteTester new.
	port masterClass: MapReduceMaster.
	port workerClass: MapReduceWorker.
	port reset.

]

{ #category : #'private-actions' }
CSNWebModelJavaDistributed >> openDistributedUi [
	(PortUi for: port ) openWithSpec.
]
