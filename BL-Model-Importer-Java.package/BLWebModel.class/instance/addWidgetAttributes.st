adding
addWidgetAttributes
	self listOfAttribute addAll:( ((self listOfWidget select: [ :widget | widget variable isNotNil ])
		collect: [ :widget | widget variable receivingInvocations collect: [ :invoc | widget createAttributeFrom: invoc ] ] )flattened reject: #isNil)