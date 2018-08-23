Extension { #name : #FAMIXAttribute }

{ #category : #'*BL-Model-CoreWeb' }
FAMIXAttribute >> uniqueName [
	^ self name, self mooseID asString 
]
