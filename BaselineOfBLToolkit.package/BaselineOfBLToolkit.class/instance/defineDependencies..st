baselines
defineDependencies: spec
	spec
		configuration: 'PetitParser'
		with: [ 
			spec
				versionString: #development;
				loads: 'Parser';
				repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ]