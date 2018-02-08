accessing
groupAtLayerWithDepth: aDepth
	| group view1 layer |
	group := self groupWithDepth: aDepth.
	view1 := self viewReferencesWithColoredGroupForDepth: 0.
	layer := view1 build layout layout layers
		collect: [ :od | od reject: #isDummy thenCollect: #model ].
	^ group
		collect: [ :g | 
			layer
				collect: [ :l | 
					(l asOrderedCollection includesAll: g asOrderedCollection)
						ifTrue: [ Association new key: l value: g ]
						ifFalse: [ nil ] ]
				thenSelect: #isNotNil ] thenSelect: #isNotEmpty