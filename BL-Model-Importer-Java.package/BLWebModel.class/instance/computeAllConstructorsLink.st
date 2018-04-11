adding
computeAllConstructorsLink
	^ (model constructors
		collect: [ :method | 
			| got |
			got := (method queryAll: #in) atScope: FAMIXClass.
			got ifNotEmpty: [ got collect: [ :p | Association new key: p value: method parentType ] ] ]) flatten