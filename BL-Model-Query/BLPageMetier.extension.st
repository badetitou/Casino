Extension { #name : #BLPageMetier }

{ #category : #'*BL-Model-Query' }
BLPageMetier >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ].
		
]

{ #category : #'*BL-Model-Query' }
BLPageMetier >> color [
	^ Color red
]

{ #category : #'*BL-Model-Query' }
BLPageMetier >> recursiveMetier [
	^ {self.
	(self metiers collect: #recursiveMetier)}
]

{ #category : #'*BL-Model-Query' }
BLPageMetier >> recursiveMetierAssoc [
	^ {self.
	(self metiers flatCollect: #recursiveMetier)}
]

{ #category : #'*BL-Model-Query' }
BLPageMetier >> recursiveMetierNodes [
	^ {self.
	(self metiers flatCollect: #recursiveMetier)} flattened
]

{ #category : #'*BL-Model-Query' }
BLPageMetier >> recursiveWidget [
	^ {self.
	(self widgets collect: #recursiveWidget).
	(self metiers collect: #recursiveWidget)}
]

{ #category : #'*BL-Model-Query' }
BLPageMetier >> relativePathToHome [
	^ self container relativePathToHome , '../../'
]
