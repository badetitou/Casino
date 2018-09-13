Extension { #name : #MooseAbstractGroup }

{ #category : #'*BL-Model-CoreWeb' }
MooseAbstractGroup >> allBLActionsAttribute [
	<navigation: 'BL Actions Attribute'>
	^ self allWithSubTypesOf: BLActionAttribute
]

{ #category : #'*BL-Model-CoreWeb' }
MooseAbstractGroup >> allBLInputText [
	<navigation: 'BL Input Text'>
	^ self allWithType: BLInputText
]

{ #category : #'*BL-Model-CoreWeb' }
MooseAbstractGroup >> allBLLinkButton [
	<navigation: 'BL Link Button'>
	^ self allWithType: BLLinkButton
]

{ #category : #'*BL-Model-CoreWeb' }
MooseAbstractGroup >> allBLPanel [
	<navigation: 'BL Panel'>
	^ self allWithType: BLUIPanel
]
