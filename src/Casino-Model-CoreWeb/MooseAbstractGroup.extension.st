Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-CoreWeb' }
MooseAbstractGroup >> allCSNInputText [
	<navigation: 'BL Input Text'>
	^ self allWithType: CSNUIInput
]
