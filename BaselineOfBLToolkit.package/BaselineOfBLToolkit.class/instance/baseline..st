baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
				self definePackages: spec.
				self defineGroups: spec. 
				 ]