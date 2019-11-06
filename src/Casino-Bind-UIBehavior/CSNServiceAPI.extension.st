Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNServiceAPI >> callers [
	"Relation named: #callers type: #CSNBCall opposite: #distantService"

	<generated>
	<derived>
	<FMProperty: #callers type: #CSNBCall opposite: #distantService>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #callers ifAbsentPut: [ FMMultivalueLink on: self opposite: #distantService: ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNServiceAPI >> callers: anObject [

	<generated>
	self callers value: anObject
]
