private
usageOfGWTWidget
   | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | (((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ])atScope: FAMIXClass)  collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | self isClassFromGWT: b value ] ].
	^ (references collect: #value) asBag 