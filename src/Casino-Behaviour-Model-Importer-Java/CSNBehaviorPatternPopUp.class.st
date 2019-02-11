Class {
	#name : #CSNBehaviorPatternPopUp,
	#superclass : #CSNBehaviorPattern,
	#category : #'Casino-Behaviour-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternPopUp >> newPopUp [
	^ self model add: CSNBPopUp new
]

{ #category : #running }
CSNBehaviorPatternPopUp >> run [
	self model allFASTJavaIdentifier 
		select: [ :identifier | (identifier name = 'Window') and: [ identifier parentNode isNotNil and: [ identifier parentNode name = 'alert' ] ] ] 
		thenDo: [:identifier | | popUp |
			popUp := self newPopUp data: identifier parentNode arguments first.
			identifier parentNode parentNode childrenNode add: popUp.
			identifier parentNode parentNode childrenNode remove: identifier parentNode.
			self model removeAll: { identifier parentNode. identifier }
			].
]
