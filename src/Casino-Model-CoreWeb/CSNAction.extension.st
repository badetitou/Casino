Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-CoreWeb-accessing' }
CSNAction >> linkExtended [
	"Relation named: #linkExtended type: #CSNUICWExtendedLink opposite: #additionalActions"

	<generated>
	<FMProperty: #linkExtended type: #CSNUICWExtendedLink opposite: #additionalActions>
	<package: #'Casino-Model-CoreWeb'>
	^ self attributeAt: #linkExtended ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-CoreWeb-accessing' }
CSNAction >> linkExtended: anObject [

	<generated>
	self attributeAt: #linkExtended put: (FMMultivalueLink on: self update: #additionalActions from: self linkExtended to: anObject).
]
