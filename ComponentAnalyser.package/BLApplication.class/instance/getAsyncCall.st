as yet unclassified
getAsyncCall
	"^ self getConstructor collect: [ :method | method queryAll: #in ]"

	^ (self getConstructor
		flatCollect: [ :method | 
			| got |
			got := (method queryAll: #in)
				select: [ :e | e to belongsTo superclassHierarchy includes: self asyncClass  ].
			got ]) 