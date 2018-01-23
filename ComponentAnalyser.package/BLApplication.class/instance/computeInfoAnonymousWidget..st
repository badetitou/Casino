accessing
computeInfoAnonymousWidget: anAnonymousWidget
	^ {(#nLOC -> anAnonymousWidget numberOfLinesOfCode).
	(#classomplexity -> (self classComplexityFor: anAnonymousWidget)).
	(#redefinedMethod -> (anAnonymousWidget methods select: #isOverriding ))} asDictionary