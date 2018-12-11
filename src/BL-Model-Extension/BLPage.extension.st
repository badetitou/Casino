Extension { #name : #BLPage }

{ #category : #'*BL-Model-Extension' }
BLPage >> addBusinessPage: aBusinessPage [
	self businessPage add: aBusinessPage
]

{ #category : #'*BL-Model-Extension' }
BLPage >> name [
	^ name 
]

{ #category : #'*BL-Model-Extension' }
BLPage >> recursiveMetiers [
	^ (self businessPage, (self businessPage collect: #recursiveMetiers)) flattened
]
