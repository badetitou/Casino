accessing
linkFromConstructorWithoutSuperCall
	^ linkFromConstructorWithoutSuperCall
		ifNil: [ linkFromConstructorWithoutSuperCall := (self getConstructor 
				collect: [ :method | 
					| got |
					got := ((method incomingInvocations ) reject: [ :el | el receiver ifNil: [false] ifNotNil: [ :n | n name = #super] ]) collect: [ :a | (a candidates at: 1) parentType ].
					got
						ifNotEmpty: [ got collect: [ :p | Association new key: p value: method parentType ] ] ])
				flatten ]