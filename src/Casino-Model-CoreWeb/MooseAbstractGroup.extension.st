Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-CoreWeb' }
MooseAbstractGroup >> allBLInputText [
	<navigation: 'BL Input Text'>
	^ self allWithType: CSNUIInput
]
