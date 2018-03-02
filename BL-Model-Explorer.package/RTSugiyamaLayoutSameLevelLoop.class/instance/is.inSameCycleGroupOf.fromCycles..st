private
is: el1 inSameCycleGroupOf: el2 fromCycles: cycles
	^ cycles anySatisfy: [ :collection | (collection includes: el1) and: [ collection includes: el2 ] ]