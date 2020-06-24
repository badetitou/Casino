Extension { #name : #Set }

{ #category : #'*Casino-Model-Extension' }
Set >> anyOneIfOnlyOneElement [
	^ self size ~= 1 ifTrue: [ Error signal: 'This Set has more than one element and using anyOne on it can create an error' ] ifFalse: [ self anyOne ]
]
