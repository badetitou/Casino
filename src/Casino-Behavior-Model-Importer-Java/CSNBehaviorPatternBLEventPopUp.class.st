Class {
	#name : #CSNBehaviorPatternBLEventPopUp,
	#superclass : #CSNBehaviorPatternPopUp,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternBLEventPopUp >> run [
	self model allFASTJavaIdentifier 
		select: [ :identifier | (identifier name = 'BLEventPopup') and: [ identifier parentNode isNotNil ] ] 
		thenDo: [:identifier | | popUp |
			popUp := self newPopUp data: identifier parentNode arguments first.
			identifier parentNode parentNode childrenNode add: popUp.
			identifier parentNode parentNode childrenNode remove: identifier parentNode.
			self model removeAll: { identifier parentNode. identifier }
			].
]
