adding
addWidgetAttributes
	(self listOfWidget select: [ :widget | widget variable isNotNil ])
		do: [ :widget | 
			widget variable receivingInvocations
				do: [ :invoc | (BLAttribute newFor: invoc) ifNotNil: [ :attribute | widget attributes add: attribute ] ] ]