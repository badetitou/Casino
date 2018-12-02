Extension { #name : #BLBusinessPage }

{ #category : #'*BL-Model-Query' }
BLBusinessPage >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ].
		
]

{ #category : #'*BL-Model-Query' }
BLBusinessPage class >> color [
	^ Color red
]

{ #category : #'*BL-Model-Query' }
BLBusinessPage >> recursiveMetier [
	^ {self.
	(self metiers collect: #recursiveMetier)}
]

{ #category : #'*BL-Model-Query' }
BLBusinessPage >> recursiveMetierAssoc [
	^ {self.
	(self metiers flatCollect: #recursiveMetier)}
]

{ #category : #'*BL-Model-Query' }
BLBusinessPage >> recursiveMetierNodes [
	^ {self.
	(self metiers flatCollect: #recursiveMetier)} flattened
]
