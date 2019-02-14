Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNCheckBox [
	<navigation: 'BL CheckBox'>
	^ self allWithType: CSNUIInputCheckbox
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNFieldset [
	<navigation: 'BL Fieldset'>
	^ self allWithType: CSNUIFieldset
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNLabel [
	<
	navigation:
		'BLParagraph'>
	^ self
		allWithType:
			CSNUIParagraph
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNLinkButton [
	<navigation: 'BL Button'>
	^ self allWithType: CSNUIButton
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNLinkLabel [
	<navigation: 'BL Link'>
	^ self allWithType: CSNUILink
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNPanel [
	<navigation: 'BL Panel'>
	^ self allWithType: CSNUIPanel
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNUiPanel [
	
	<navigation: 'BL UiPanel'>
	^ self allWithSubTypesOf: CSNUIPanel 
]
