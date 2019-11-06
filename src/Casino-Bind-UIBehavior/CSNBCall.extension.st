Extension { #name : #CSNBCall }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNBCall >> distantService [
	"Relation named: #distantService type: #CSNServiceAPI opposite: #callers"

	<generated>
	<FMProperty: #distantService type: #CSNServiceAPI opposite: #callers>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #distantService ifAbsent: [ nil ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNBCall >> distantService: anObject [

	<generated>
	self privateState attributeAt: #distantService put: (FMMultivalueLink on: self update: #callers from: self distantService to: anObject).
]
