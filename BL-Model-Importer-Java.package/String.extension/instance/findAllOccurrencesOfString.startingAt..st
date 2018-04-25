*BL-Model-Importer-Java
findAllOccurrencesOfString: substring startingAt: start

	| col last |
	col := OrderedCollection new.
	last := self findString: substring startingAt: start.
	[ last > 0 ]
		whileTrue: [ col add: last.
			last := self findString: substring startingAt: last + 1 ].
	^ col