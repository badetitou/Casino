Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNAction [
	<navigation: 'BL Actions'>
	^ self allWithSubTypesOf: CSNAction
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNActionAppel [
	<navigation: #CSNActionAppel>
	^ self allWithSubTypesOf: CSNActionAppel 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNAttributes [
	<navigation: 'BL Attributes'>
	^ self allWithSubTypesOf: CSNAttribute
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNCell [
	<navigation: 'BL Cell'>
	^ self allWithSubTypesOf: CSNLCell 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNLayout [
	<navigation: 'Sub-Layout'>
	^ self allWithSubTypesOf: CSNLLayout
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNPage [
	<navigation: 'BL Page'>
	^ self allWithSubTypesOf: CSNPage
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNPageMetier [
	<navigation: 'BL Page Metier'>
	^ self allWithSubTypesOf: CSNBusinessPage 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNService [
	<navigation: 'BL Service'>
	^ self allWithSubTypesOf: CSNService 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNServiceAPI [
	<navigation: #CSNServiceAPI>
	^ self allWithSubTypesOf: CSNServiceAPI
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNUiContainer [
	
	<navigation: 'BL UiContainer'>
	^ self allWithSubTypesOf: CSNContainer 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidget [
	<navigation: 'Sub-Widget'>
	^ self allWithSubTypesOf: CSNWidget
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidgetExceptPage [
	<navigation: 'Sub-Widget ExceptPage'>
	^ self privateState
		cacheAt: 'Sub-Widget ExceptPage'
		ifAbsentPut: [ (self allWithSubTypesOf: CSNWidget) reject: [ :el | (el isOfType: CSNPage) or: [ el isOfType: CSNBusinessPage ] ] ]
]
