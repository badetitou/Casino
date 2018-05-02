adding
addWidgetAttributes
	"(self listOfWidget select: [ :widget | widget variable isNotNil ])
		do: [ :widget | 
			(widget variable receivingInvocations
				select: [ :invoc | ('set*' match: invoc signature) and: [ ('setWidget*' match: invoc signature) not ] ])
				do: [ :invoc | widget attributes at: invoc attributeName put: invoc parameters ] ]"