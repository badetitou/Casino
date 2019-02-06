Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Extension' }
CSNPage >> addBusinessPage: aBusinessPage [
	self businessPage add: aBusinessPage
]

{ #category : #'*Casino-Model-Extension' }
CSNPage >> name [
	^ name 
]

{ #category : #'*Casino-Model-Extension' }
CSNPage >> recursiveMetiers [
	^ (self businessPage, (self businessPage collect: #recursiveMetiers)) flattened
]
