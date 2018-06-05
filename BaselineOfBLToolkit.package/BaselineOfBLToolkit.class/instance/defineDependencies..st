baselines
defineDependencies: spec
	spec
		configuration: 'PetitParser'
		with: [ spec
				versionString: #development;
				loads: 'Parser';
				repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
	spec
		configuration: 'PetitParser2'
		with: [ spec
				versionString: #development;
				loads: 'Headless';
				repository: 'https://github.com/kursjan/petitparser2' ]