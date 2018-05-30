as yet unclassified
handleIdentifier: anIndentifier
	self flag: #todo.
	(self model allBLService select: [ :service | service name = anIndentifier name ]) ifEmpty: [ self next handleIdentifier: anIndentifier ] ifNotEmpty: [:serviceInCollection |  anIndentifier name: (serviceInCollection at: 1) getVariableName ] 