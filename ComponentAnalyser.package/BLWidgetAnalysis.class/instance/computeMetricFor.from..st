accessing
computeMetricFor: aClass from: data1
	| localResult |
	localResult := Dictionary new.
	localResult at: #view put: (data1 at: aClass ifAbsent: [ #notImplemented ]).
	^ localResult 