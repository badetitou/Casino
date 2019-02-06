Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Query' }
CSNBusinessPage >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ].
		
]

{ #category : #'*Casino-Model-Query' }
CSNBusinessPage class >> color [
	^ Color red
]

{ #category : #'*Casino-Model-Query' }
CSNBusinessPage >> recursiveMetier [
	^ {self.
	(self metiers collect: #recursiveMetier)}
]

{ #category : #'*Casino-Model-Query' }
CSNBusinessPage >> recursiveMetierAssoc [
	^ {self.
	(self metiers flatCollect: #recursiveMetier)}
]

{ #category : #'*Casino-Model-Query' }
CSNBusinessPage >> recursiveMetierNodes [
	^ {self.
	(self metiers flatCollect: #recursiveMetier)} flattened
]
