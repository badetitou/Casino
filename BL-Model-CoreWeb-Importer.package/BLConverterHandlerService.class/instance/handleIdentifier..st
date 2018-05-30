as yet unclassified
handleIdentifier: anIndentifier
	self flag: #todo.
	(self model allBLService select: [ :service | service name = anIndentifier name ]) ifNotEmpty: [:serviceInCollection |  anIndentifier name: (serviceInCollection at: 1) getVariableName ] ifEmpty: [ self next handleIdentifier: anIndentifier ]