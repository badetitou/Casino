Extension { #name : #FamixJavaMethod }

{ #category : #'*Casino-Business-Model-Extension' }
FamixJavaMethod >> isFromClient [

	^ parentType sourceAnchor fileName includesSubstring: '/client/src/'
]

{ #category : #'*Casino-Business-Model-Extension' }
FamixJavaMethod >> isFromServer [

	^ parentType sourceAnchor fileName includesSubstring: '/serveur/src/'
]

{ #category : #'*Casino-Business-Model-Extension' }
FamixJavaMethod >> isUsedByClient: aCache [

	^ aCache at: self ifAbsentPut: [ 
		  self isFromClient or: [ 
			  self accesses anySatisfy: [ :access | 
				  self = access accessor
					  ifTrue: false
					  ifFalse: [ access accessor isUsedByClient: aCache ] ] ] ]
]

{ #category : #'*Casino-Business-Model-Extension' }
FamixJavaMethod >> isUsedByServer: aCache [

	^ aCache at: self ifAbsentPut: [ 
		  self isFromServer or: [ 
			  self accesses anySatisfy: [ :access | 
				  self = access accessor
					  ifTrue: false
					  ifFalse: [ access accessor isUsedByServer: aCache ] ] ] ]
]
