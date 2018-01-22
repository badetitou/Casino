accessing
computeMetricFor: aClass from: data1
	| localResult |
	localResult := Dictionary new.
	localResult at: #genericView put: (data1 at: aClass ifAbsent: [ #notImplemented ]).
	localResult
		at: #nLoc
		put:
			(data1
				at: aClass
				ifPresent: [ :a | a view elements sum: [ :el | el model numberOfLinesOfCode ] ]).
	localResult
		at: #depth
		put:
			(data1
				at: aClass
				ifPresent: [ :a | ( self computeDepthOf: aClass in: ((data1 at: aClass) view)) ]).
	^ localResult