Extension { #name : #CSNBuAttribute }

{ #category : #'*Casino-Business-Model-Extension' }
CSNBuAttribute >> isUsedByClient [

	| seen |
	seen := Dictionary new.
	^ self source incomingAccesses anySatisfy: [ :access | 
		  access accessor isUsedByClient: seen ]
]

{ #category : #'*Casino-Business-Model-Extension' }
CSNBuAttribute >> isUsedByServer [

	| seen |
	seen := Dictionary new.
	^ self source incomingAccesses anySatisfy: [ :access | 
		  access accessor isUsedByServer: seen ]
]
