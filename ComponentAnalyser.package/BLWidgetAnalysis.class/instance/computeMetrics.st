accessing
computeMetrics
	| data data1 nbUsage results |
	data1 := self widgetDependencies.
	data := (data1 collect: [ :el | el view elements collect: #model ]) values flatten.
	nbUsage := data asBag.
	results := Dictionary new.
	data asSet
		do: [ :aClass | results at: aClass put: (self computeMetricFor: aClass from: data1). (results at: aClass) at: #nbUsage put: (nbUsage occurrencesOf: aClass)].
	^ results