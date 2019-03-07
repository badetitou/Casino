Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNServiceAPI >> callers [

	<generated>
	<MSEProperty: #callers type: #Object>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #callers ifAbsentPut: [ FMMultivalueLink on: self opposite: #distantService: ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNServiceAPI >> callers: anObject [

	<generated>
	self callers value: anObject
]
