as yet unclassified
getListOfServiceActionForServiceClass: aServiceClass
	^ aServiceClass methods collect: [ :method | BLServiceAction newFor: method  ]