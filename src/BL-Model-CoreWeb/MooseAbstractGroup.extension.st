Extension { #name : #MooseAbstractGroup }

{ #category : #'*BL-Model-CoreWeb' }
MooseAbstractGroup >> allBLInputText [
	<navigation: 'BL Input Text'>
	^ self allWithType: BLUIInput
]
