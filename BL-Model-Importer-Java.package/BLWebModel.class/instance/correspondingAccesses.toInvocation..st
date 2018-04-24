private
correspondingAccesses: aListOfAccesses toInvocation: anInvocation
	^ ((aListOfAccesses select: [ :access | access sourceAnchor startPos < anInvocation sourceAnchor startPos ])
		sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) ifNotEmpty: [ :a | a last ] ifEmpty: [ ^ nil ]