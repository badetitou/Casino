Class {
	#name : #CSNBehaviorPatternNavigation,
	#superclass : #CSNBehaviorPattern,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternNavigation >> newNavigation [
	^ self model silentlyAdd: CSNBNavigation new
]

{ #category : #running }
CSNBehaviorPatternNavigation >> run [
	self model allFASTJavaIdentifier 
		select: [ :identifier | (identifier name = 'Workspace') and: [ identifier parentNode isNotNil and: [ identifier parentNode name = 'getPhaseManager' 
					and: [ identifier parentNode parentNode isNotNil and: [ identifier parentNode parentNode name = 'displayPhase' and: [ identifier parentNode parentNode class = FASTJavaMethodInvocation ] ]]] ] ] 
		thenDo: [:identifier | | navigation |
			navigation := self newNavigation.
			identifier parentNode parentNode parentNode childrenNode add: navigation.
			navigation arguments addAll: (identifier parentNode parentNode arguments).
			self model silentlyRemoveAll: { identifier parentNode parentNode.identifier parentNode. identifier }
			].
]
