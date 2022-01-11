Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Extension' }
CSNBusinessPage >> metiers [
	^ self widgets select: [ :widget | widget isPageMetier  ]
]

{ #category : #'*Casino-Model-Extension' }
CSNBusinessPage >> name [
	^ name
]

{ #category : #'*Casino-Model-Extension' }
CSNBusinessPage >> recursiveElements [
	^ (self widgets , (self widgets collect: #recursiveElements))
]

{ #category : #'*Casino-Model-Extension' }
CSNBusinessPage >> recursiveMetiers [
	^ (self metiers , (self metiers collect: #recursiveMetiers)) flattened
]
