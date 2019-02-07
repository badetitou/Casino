Extension { #name : #CSNAction }

{ #category : #'*CSN-UIFASTBinding-accessing' }
CSNAction >> behavior [

	<generated>
	<MSEProperty: #behavior type: #Object>
	<package: #'CSN-UIFASTBinding'>
	^ self privateState attributeAt: #behavior ifAbsentPut: [ FMMultivalueLink on: self opposite: #ui: ]
]

{ #category : #'*CSN-UIFASTBinding-accessing' }
CSNAction >> behavior: anObject [

	<generated>
	self behavior value: anObject
]
