operations
distanceFromSolutionOf: individual
	"Probably error * gamma, partial * beta, good * alpha"

	| result distance |
	distance := 0.
	result := self exampleDataSource collect: [ :source | individual evaluateUsing: source ].
	1 to: self exampleDataSource size do: [ :idx | 
		distance := distance
			+ (self distanceBetween: (result at: idx) and: (self exampleDataTarget at: idx)) ].
	^ distance