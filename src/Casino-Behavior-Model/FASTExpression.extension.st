Extension { #name : #FASTExpression }

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTExpression >> navigation [

	<generated>
	<MSEProperty: #navigation type: #Object>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #navigation ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTExpression >> navigation: anObject [

	<generated>
	self privateState attributeAt: #navigation put: (FMMultivalueLink on: self update: #arguments from: self navigation to: anObject).
]
