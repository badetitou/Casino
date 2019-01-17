Extension { #name : #BLAction }

{ #category : #'*CSN-UIFASTBinding-accessing' }
BLAction >> addBehavior: aFASTJavaMethod [

	self behavior add: aFASTJavaMethod 
]

{ #category : #'*CSN-UIFASTBinding-accessing' }
BLAction >> behavior [

	<generated>
	<MSEProperty: #behavior type: #Object>
	<package: #'CSN-UIFASTBinding'>
	^ self privateState attributeAt: #behavior ifAbsentPut: [ FMMultivalueLink on: self opposite: #ui: ]
]

{ #category : #'*CSN-UIFASTBinding-accessing' }
BLAction >> behavior: anObject [

	<generated>
	self behavior value: anObject
]
