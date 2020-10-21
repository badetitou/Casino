Extension { #name : #Set }

{ #category : #'*Casino-Model-Extension' }
Set >> anyOneIfOnlyOneElement [
	^ self size ~= 1
		ifTrue: [ Error
				signal:
					(String
						streamContents: [ :content | 
							content
								nextPutAll:
									'This Set has more than one element and using anyOne on it can create an error:'.
							content crlf.
							self
								do: [ :el | content nextPutAll: el printString ]
								separatedBy: [ content crlf ] ]) ]
		ifFalse: [ self anyOne ]
]
