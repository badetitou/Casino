Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNCheckBox [
	<navigation: 'BL CheckBox'>
	^ self allWithSubTypesOf: CSNUIInputCheckbox
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNFieldset [
	<navigation: 'BL Fieldset'>
	^ self allWithSubTypesOf: CSNUIFieldset
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNLabel [
	<navigation: 'BLParagraph'>
	^ self allWithSubTypesOf: CSNUIParagraph
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNLinkButton [
	<navigation: 'BL Button'>
	^ self allWithSubTypesOf: CSNUIButton
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNLinkLabel [
	<navigation: 'BL Link'>
	^ self allWithSubTypesOf: CSNUILink
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNPanel [
	<navigation: 'BL Panel'>
	^ self allWithSubTypesOf: CSNUIPanel
]

{ #category : #'*Casino-Model-UI-SubEntities' }
MooseAbstractGroup >> allCSNUiPanel [
	<navigation: 'BL UiPanel'>
	^ self allWithSubTypesOf: CSNUIPanel
]
