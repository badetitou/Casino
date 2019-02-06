Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLCheckBox [
	<navigation: 'BL CheckBox'>
	^ self allWithType: CSNUIInputCheckbox
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLFieldset [
	<navigation: 'BL Fieldset'>
	^ self allWithType: CSNUIFieldset
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLLabel [
	<
	navigation:
		'BLParagraph'>
	^ self
		allWithType:
			CSNUIParagraph
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLLinkButton [
	<navigation: 'BL Button'>
	^ self allWithType: CSNUIButton
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLLinkLabel [
	<navigation: 'BL Link'>
	^ self allWithType: CSNUILink
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLPanel [
	<navigation: 'BL Panel'>
	^ self allWithType: CSNUIPanel
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allBLUiPanel [
	
	<navigation: 'BL UiPanel'>
	^ self allWithSubTypesOf: CSNUIPanel 
]
