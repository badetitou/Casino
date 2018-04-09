initialization
generateServicefrom: aBlApplication
	aBlApplication modelServices
		do: [ :aServiceClass | self listOfService  add: (self createServiceFromClass: aServiceClass ) ]