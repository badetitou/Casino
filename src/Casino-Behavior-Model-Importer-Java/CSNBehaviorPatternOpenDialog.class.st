Class {
	#name : #CSNBehaviorPatternOpenDialog,
	#superclass : #CSNBehaviorPattern,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternOpenDialog >> run [
	(self model allWithSubTypesOf: FASTJavaMethodInvocation) asOrderedCollection
		select: [ :invocation | invocation name = 'show' and: [ ((self uiModel allWithSubTypesOf: CSNUICWDialog) select: [ :dialog | dialog affectedActions = invocation receiver famixVariable ]) isNotEmpty ] ]
		thenDo: [ :invocation | self halt ]
]
