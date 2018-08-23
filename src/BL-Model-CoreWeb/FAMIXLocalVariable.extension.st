Extension { #name : #FAMIXLocalVariable }

{ #category : #'*BL-Model-CoreWeb' }
FAMIXLocalVariable >> uniqueName [
	^ self name, self mooseID asString 
]
