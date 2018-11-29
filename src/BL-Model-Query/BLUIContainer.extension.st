Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Query' }
BLUIContainer class >> color [
	^ Color green
]

{ #category : #'*BL-Model-Query' }
BLUIContainer >> outgoingElement [
	^ {self actions collect: #call. self widgets. {self layout ifNil: [ {} ]} }
]
