private
linkFromWidgetActionAppelCase1: anInvocation
	"Return the found association
	case 1 and 4
	new Widget ( new blabla ( new bleble ( CP)))"

	| found elContainer |
	found := nil.
	elContainer := anInvocation container.
	elContainer ifNil: [ ^ nil ].
	" case 1 "
	found := self searchWidgetFromConstructorInvocation: elContainer.
	found
		ifNotNil: [ ^ Association new key: found value: (self searchCalledPhaseFromInvocation: anInvocation) ]
		ifNil: [ ^ self linkFromWidgetActionAppelCase1: elContainer ]