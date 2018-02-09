accessing
extraLinkIntraLinkFromLayer
	| layers |
	layers := (self viewReferencesWithColoredGroupForDepth: 0) build layout layout layers.
	^ layers
		collect: [ :layer | 
			| extra intra |
			extra := 0.
			intra := 0.
			(layer reject: #isDummy)
				do: [ :el | 
					el connectedEdges
						do: [ :edge | 
							((layer includes: edge from) and: [ layer includes: edge to ])
								ifTrue: [ intra := intra + 1 ]
								ifFalse: [ extra := extra + 1 ] ] ]. Association new key: layer value: {#intra -> intra. #extra -> extra}].