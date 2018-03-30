private
usageOfAllWidgetWithCode

   | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | ((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ])  collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | (self isClassFromGWT: (b value to at: 1) belongsTo) or: [ self isClassFromWidget: (b value to at: 1) belongsTo ] ] ].
	^ (references collect: #value) asBag 