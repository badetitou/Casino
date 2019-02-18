Class {
	#name : #CSNBehaviorPatternBLErrBoxPopUp,
	#superclass : #CSNBehaviorPatternPopUp,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternBLErrBoxPopUp >> run [
	self model allFASTJavaIdentifier
		select: [ :identifier | 
			identifier name = 'BLErrBox'
				and: [ identifier parentNode isNotNil
						and: [ identifier parentNode arguments isNotEmpty ] ] ]
		thenDo: [ :identifier | 
			| popUp |
			popUp := self newPopUp data: identifier parentNode arguments first.
			identifier parentNode parentNode childrenNode add: popUp.
			identifier parentNode parentNode childrenNode
				remove: identifier parentNode.
			self model
				removeAll:
					{identifier parentNode.
					identifier} ]
]
