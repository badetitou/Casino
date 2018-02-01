accessing
searchTopElementFor: anElement
	| edges result |
	edges := anElement connectedEdges ifEmpty: [ ^anElement model ].
	result := Set new.
	result := edges select: [ :a | a to = anElement ] thenCollect: [:a | a from ].
	[edges isNotEmpty ] whileTrue: [ result := edges collect: #from. edges := (result flatCollect: #connectedEdges) select: [ :a | result includes: a to ] ].
	^ (result at: 1) model