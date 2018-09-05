Extension { #name : #MooseAbstractGroup }

{ #category : #'*BL-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLCheckBox [
	<navigation: 'BL CheckBox'>
	^ self allWithType: BLUIInputCheckbox
]

{ #category : #'*BL-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLLabel [
	<navigation: 'BLLabel'>
	^ self allWithType: BLUILabel
]
