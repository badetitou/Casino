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
	^ self allWithType: CSNCell 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNLayout [
	<navigation: 'Sub-Layout'>
	^ self allWithSubTypesOf: CSNLayout
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNPage [
	<
	navigation:
		'BL Page'>
	^ self
		allWithType:
			CSNPage
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNPageMetier [
	<navigation: 'BL Page Metier'>
	^ self allWithType: CSNBusinessPage 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNService [
	<navigation: 'BL Service'>
	^ self allWithType: CSNService 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNServiceAPI [
	<navigation: #CSNServiceAPI>
	^ self allWithSubTypesOf: CSNServiceAPI
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNUiContainer [
	
	<navigation: 'BL UiContainer'>
	^ self allWithType: CSNContainer 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidget [
	<navigation: 'Sub-Widget'>
	^ self allWithSubTypesOf: CSNWidget
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidgetExceptPage [
	<navigation: 'Sub-Widget ExceptPage'>
	^ (self allWithSubTypesOf: CSNWidget)
		reject: [ :el | (el isKindOf: CSNPage) or: [ el isKindOf: CSNBusinessPage ] ]
]
