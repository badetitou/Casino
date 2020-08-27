Extension { #name : #Collection }

{ #category : #'*Casino-Helper' }
Collection >> ifNotEmptyDo: notEmptyBlock ifEmpty: emptyBlock [
	^ self
		ifNotEmpty: [ :col | col do: notEmptyBlock ]
		ifEmpty: emptyBlock
]
