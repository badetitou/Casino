Class {
	#name : #CSNBehaviorPatternPopUp,
	#superclass : #CSNBehaviorPattern,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternPopUp >> newPopUp [
	^ self model silentlyAdd: CSNBPopUp new
]

{ #category : #running }
CSNBehaviorPatternPopUp >> run [
	self model allFASTJavaIdentifier 
		select: [ :identifier | (identifier name = 'Window') and: [ identifier parentNode isNotNil and: [ identifier parentNode name = 'alert' ] ] ] 
		thenDo: [:identifier | | popUp data |
			popUp := self newPopUp.
			identifier parentNode parentNode expression: popUp.
			data := identifier parentNode arguments first.
			data removeAllPotentialParentNode.
			popUp data: data.
			self model silentlyRemoveAll: { identifier parentNode. identifier }
			].
]
