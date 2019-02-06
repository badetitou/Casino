Extension { #name : #CSNUIContainer }

{ #category : #'*Casino-Model-Query' }
CSNUIContainer class >> color [
	^ Color green
]

{ #category : #'*Casino-Model-Query' }
CSNUIContainer >> outgoingElement [
	^ {self actions collect: #call. self widgets. {self layout ifNil: [ {} ]} }
]
