Class {
	#name : #CSNBehaviorPatternBLEventPopUp,
	#superclass : #CSNBehaviorPatternPopUp,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternBLEventPopUp >> run [
	self model allFASTJavaIdentifier asOrderedCollection
		select: [ :identifier | (identifier name = 'BLEventPopup') and: [ identifier parentNode isNotNil and: [ identifier parentNode arguments isNotEmpty ] ] ] 
		thenDo: [:identifier | | popUp |
			popUp := self newPopUp data: identifier parentNode arguments first.
			identifier parentNode parentNode expression: popUp.
			self model removeAll: { identifier parentNode. identifier }
			].
]
