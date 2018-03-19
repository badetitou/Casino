example
distanceFromSolutionOf: individual
	"Probably error * gamma, partial * beta, good * alpha"

	| result |
	result := self exampleDataSource collect: [ :source | individual evaluateUsing: source ].
	1 to: self exampleDataSource size do: [ :idx | result := self distanceBetween: (result at: idx) and: (self exampleDataTarget at: idx) ]