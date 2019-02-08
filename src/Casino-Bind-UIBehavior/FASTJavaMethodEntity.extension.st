Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
FASTJavaMethodEntity >> ui [

	<generated>
	<MSEProperty: #ui type: #Object>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #ui ifAbsent: [ nil ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
FASTJavaMethodEntity >> ui: anObject [

	<generated>
	self privateState attributeAt: #ui put: (FMMultivalueLink on: self update: #behavior from: self ui to: anObject).
]
