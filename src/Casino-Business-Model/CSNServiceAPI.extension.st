Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Business-Model-accessing' }
CSNServiceAPI >> dataType [
	"Relation named: #dataType type: #CSNBuDTO opposite: #usedInServices"

	<generated>
	<FMProperty: #dataType type: #CSNBuDTO opposite: #usedInServices>
	<package: #'Casino-Business-Model'>
	^ self privateState attributeAt: #dataType ifAbsent: [ nil ]
]

{ #category : #'*Casino-Business-Model-accessing' }
CSNServiceAPI >> dataType: anObject [

	<generated>
	self privateState attributeAt: #dataType put: (FMMultivalueLink on: self update: #usedInServices from: self dataType to: anObject).
]
