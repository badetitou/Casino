*BL-Model-Query
accessesAtLevel: aLevel
	aLevel == 0
		ifTrue: [ ^ nil ].
	^ self actionsAppel collect: [ :a | a -> actionsAppel collect: #accessesAtLevel ]