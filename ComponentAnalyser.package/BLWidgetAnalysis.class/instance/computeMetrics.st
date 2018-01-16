accessing
computeMetrics
	| data data1 results |
	data1 := self widgetDependencies.
	data := (data1 collect: [ :el | el view elements collect: #model ]) values flatten.
	results := Dictionary new.
	data asSet do: [ :aClass | results at: aClass put: (self computeMetricFor: aClass from: data1 ) ].
	^ results