as yet unclassified
generateServiceAction
	self listOfServiceAction
		addAll:
			((self listOfService
				collect: [ :service | 
					service addAllActions: 
					(self getListOfServiceActionForServiceClass: service source)]) collect: #actions) flattened