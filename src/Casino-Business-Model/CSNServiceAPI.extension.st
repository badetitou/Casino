Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Business-Model-accessing' }
CSNServiceAPI >> dataType [
	"Relation named: #dataType type: #CSNBuDTO opposite: #usedInServices"

	<generated>
	<FMProperty: #dataType type: #CSNBuDTO opposite: #usedInServices>
	<package: #'Casino-Business-Model'>
	^ self attributeAt: #dataType ifAbsent: [ nil ]
]

{ #category : #'*Casino-Business-Model-accessing' }
CSNServiceAPI >> dataType: anObject [

	<generated>
	self attributeAt: #dataType put: (FMMultivalueLink on: self update: #usedInServices from: self dataType to: anObject).
]
