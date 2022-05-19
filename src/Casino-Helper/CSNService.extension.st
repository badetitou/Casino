Extension { #name : #CSNService }

{ #category : #'*Casino-Helper' }
CSNService >> isChildService [

	^ parentService isNotNil
]

{ #category : #'*Casino-Helper' }
CSNService >> isParentService [

	^ childServices isNotEmpty
]

{ #category : #'*Casino-Helper' }
CSNService >> sortedActions [

	^ actions sorted: [ :a1 :a2 | 
		  (a1 source
			   ifNil: 0
			   ifNotNil: [ :source | source sourceAnchor startPos ])
		  < (a2 source
				   ifNil: 0
				   ifNotNil: [ :source | source sourceAnchor startPos ]) ]
]
