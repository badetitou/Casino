Extension { #name : #BLBusinessPage }

{ #category : #'*BL-Model-Extension' }
BLBusinessPage >> metiers [
	^ self widgets select: [ :widget | widget isPageMetier  ]
]

{ #category : #'*BL-Model-Extension' }
BLBusinessPage >> recursiveMetiers [
	^ (self metiers , (self metiers collect: #recursiveMetiers)) flattened
]

{ #category : #'*BL-Model-Extension' }
BLBusinessPage >> recursiveWidgets [
	^ (self widgets , (self widgets collect: #recursiveWidgets)) flattened
]
