Extension { #name : #CSNBuBusinessType }

{ #category : #'*Casino-Business-Model-Extension' }
CSNBuBusinessType >> sortedAttributes [

	^ attributes sorted: [ :a1 :a2 | 
		  (a1 source ifNil: 0 ifNotNil: [ :src | src sourceAnchor ifNil: 0 ifNotNil: [ :srcAnchor | srcAnchor startPos ] ])
		  <
		  (a2 source ifNil: 0 ifNotNil: [ :src | src sourceAnchor ifNil: 0 ifNotNil: [ :srcAnchor | srcAnchor startPos ] ]) ]
]
