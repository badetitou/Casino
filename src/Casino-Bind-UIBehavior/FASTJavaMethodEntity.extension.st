Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
FASTJavaMethodEntity >> ui [
	"Relation named: #ui type: #CSNAction opposite: #behavior"

	<generated>
	<FMProperty: #ui type: #CSNAction opposite: #behavior>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #ui ifAbsent: [ nil ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
FASTJavaMethodEntity >> ui: anObject [

	<generated>
	self privateState attributeAt: #ui put: (FMMultivalueLink on: self update: #behavior from: self ui to: anObject).
]
