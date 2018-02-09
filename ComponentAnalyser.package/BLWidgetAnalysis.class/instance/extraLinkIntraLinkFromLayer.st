accessing
extraLinkIntraLinkFromLayer
	| layers |
	layers := (self viewReferencesWithColoredGroupForDepth: 0) build layout layout layers.
	^ layers
		collect: [ :layer | 
			| intra incomming outgoing |
			incomming := 0.
			outgoing := 0.
			intra := 0.
			(layer reject: #isDummy)
				do: [ :el | 
					el connectedEdges
						do: [ :edge | 
							(layer includes: edge from) ifTrue: [ (layer includes: edge to) ifTrue: [ intra := intra + 1 ] ifFalse: [ outgoing := outgoing + 1 ] ] ifFalse: [ incomming := incomming +1 ] ] ] .
		
			. Association new key: layer value: {#intra -> intra. #incomming -> incomming . #outgoing -> outgoing }].