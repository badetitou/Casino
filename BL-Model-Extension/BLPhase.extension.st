Extension { #name : #BLPhase }

{ #category : #'*BL-Model-Extension' }
BLPhase >> recursiveMetiers [
	^ (self pageMetiers , (self pageMetiers collect: #recursiveMetiers)) flattened
]
