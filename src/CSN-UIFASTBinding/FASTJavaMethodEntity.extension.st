Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*CSN-UIFASTBinding-accessing' }
FASTJavaMethodEntity >> ui [

	<generated>
	<MSEProperty: #ui type: #Object>
	<package: #'CSN-UIFASTBinding'>
	^ self privateState attributeAt: #ui ifAbsent: [ nil ]
]

{ #category : #'*CSN-UIFASTBinding-accessing' }
FASTJavaMethodEntity >> ui: anObject [

	<generated>
	self privateState attributeAt: #ui put: (FMMultivalueLink on: self update: #behavior from: self ui to: anObject).
]
