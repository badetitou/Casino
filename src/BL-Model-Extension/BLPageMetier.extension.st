Extension { #name : #BLPageMetier }

{ #category : #'*BL-Model-Extension' }
BLPageMetier >> recursiveMetiers [
	^ (self metiers , (self metiers collect: #recursiveMetiers)) flattened
]

{ #category : #'*BL-Model-Extension' }
BLPageMetier >> recursiveWidgets [
	^ (self widgets , (self widgets collect: #recursiveWidgets)) flattened
]