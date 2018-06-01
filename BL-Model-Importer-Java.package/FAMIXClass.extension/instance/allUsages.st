*BL-Model-Importer-Java
allUsages
	^ (self isAnonymousClass and: [self sourceAnchor isNotNil]) ifTrue: [ self belongsTo queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil and: [  el sourceAnchor startPos < self sourceAnchor startPos and: [ el sourceAnchor endPos > self sourceAnchor endPos ] ]  ] ] ifFalse: [ OrderedCollection new  ]
	