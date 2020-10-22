Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNServiceAPI >> callers [
	"Relation named: #callers type: #CSNBCall opposite: #distantService"

	<generated>
	<derived>
	<FMProperty: #callers type: #CSNBCall opposite: #distantService>
	<package: #'Casino-Behavior-Model'>
	^ self
		attributeAt: #callers
		ifAbsentPut: [ FMMultivalueLink on: self opposite: #distantService: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNServiceAPI >> callers: anObject [

	<generated>
	self callers value: anObject
]
