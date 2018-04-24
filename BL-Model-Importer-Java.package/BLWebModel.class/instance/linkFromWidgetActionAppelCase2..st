private
linkFromWidgetActionAppelCase2: anInvocation
	"Return the found association
	case 2
	var i = new Widget ()
	i.addHandler..(BlBl)"
 
	anInvocation from parentType isHandlerClass
		ifFalse: [ ^ nil ].
	self listOfWidgetContainer
		at:
			((anInvocation from parentType container outgoingInvocations
				select: [ :invoc | invoc sourceAnchor isNotNil and: [ 
					invoc sourceAnchor startPos < anInvocation sourceAnchor startPos
						and: [ invoc sourceAnchor endPos > anInvocation sourceAnchor endPos ] ] ]) at: 1 ifAbsent: [ ^ nil ])
				receiver
		ifPresent: [ :widgetContainer | 
			^ Association new
				key: widgetContainer blWidget
				value: (self searchCalledPhaseFromInvocation: anInvocation) ]
		ifAbsent: [ ^ nil ]