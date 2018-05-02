adding
addWidgetAttributes
	(self listOfWidget select: [ :widget | widget variable isNotNil ])
		do: [ :widget | 
			widget variable receivingInvocations
				do: [ :invoc | widget createAttributeFrom: invoc ] ]