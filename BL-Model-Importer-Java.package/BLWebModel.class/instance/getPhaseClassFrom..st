private
getPhaseClassFrom: realClassName
	realClassName ifNil: [ ^self ].
	^ (self sourceModel allClasses select: [ :e | realClassName = e mooseName ]) at: 1