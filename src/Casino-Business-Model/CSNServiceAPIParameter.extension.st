Extension { #name : #CSNServiceAPIParameter }

{ #category : #'*Casino-Business-Model-accessing' }
CSNServiceAPIParameter >> dataType [
	"Relation named: #dataType type: #CSNBuDTO opposite: #usedAsParameterType"

	<generated>
	<FMProperty: #dataType type: #CSNBuDTO opposite: #usedAsParameterType>
	<package: #'Casino-Business-Model'>
	^ self attributeAt: #dataType ifAbsent: [ nil ]
]

{ #category : #'*Casino-Business-Model-accessing' }
CSNServiceAPIParameter >> dataType: anObject [
	<generated>
	self
		attributeAt: #dataType
		put:
			(FMMultivalueLink
				on: self
				update: #usedAsParameterType
				from: self dataType
				to: anObject)
]
