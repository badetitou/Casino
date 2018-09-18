Extension { #name : #MooseAbstractGroup }

{ #category : #'*BL-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLCheckBox [
	<navigation: 'BL CheckBox'>
	^ self allWithType: BLUIInputCheckbox
]

{ #category : #'*BL-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLFieldset [
	<navigation: 'BL Fieldset'>
	^ self allWithType: BLUIFieldset
]

{ #category : #'*BL-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLLabel [
	<
	navigation:
		'BLParagraph'>
	^ self
		allWithType:
			BLUIParagraph
]

{ #category : #'*BL-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLLinkLabel [
	<navigation: 'BL Link'>
	^ self allWithType: BLUILink
]
