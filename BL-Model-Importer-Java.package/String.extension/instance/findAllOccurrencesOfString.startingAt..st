*BL-Model-Importer-Java
findAllOccurrencesOfString: substring startingAt: start
	"Answer the index of the last occurrence of substring within the receiver, starting at start. If 
	the receiver does not contain substring, answer 0.  Case-sensitive match used."

	| col last |
	col := OrderedCollection new.
	last := self findString: substring startingAt: start.
	[ last > 0 ]
		whileTrue: [ col add: last.
			last := self findString: substring startingAt: last + 1 ].
	^ col