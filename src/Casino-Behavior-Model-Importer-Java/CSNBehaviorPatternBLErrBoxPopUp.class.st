Class {
	#name : #CSNBehaviorPatternBLErrBoxPopUp,
	#superclass : #CSNBehaviorPatternPopUp,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternBLErrBoxPopUp >> run [
	self model allFASTJavaIdentifier
		select: [ :identifier | identifier name = 'BLErrBox' and: [ identifier parentNode isNotNil and: [ identifier parentNode arguments isNotEmpty ] ] ]
		thenDo: [ :identifier | 
			| popUp data |
			popUp := self newPopUp.
			identifier parentNode parentNode expression: popUp.
			data := identifier parentNode arguments first.
			data removeAllPotentialParentNode.
			popUp data: data.
			self model removeAll: {identifier parentNode . identifier} ]
]
