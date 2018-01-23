accessing
computeInfoAnonymousWidget: anAnonymousWidget
	^ {(#nLOC -> anAnonymousWidget numberOfLinesOfCode).
	(#classomplexity -> (self classComplexityFor: anAnonymousWidget))} asDictionary