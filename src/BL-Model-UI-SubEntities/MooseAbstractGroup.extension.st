Extension { #name : #MooseAbstractGroup }

{ #category : #'*BL-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLLabel [
	<navigation: 'BLLabel'>
	^ self allWithType: BLUILabel
]
