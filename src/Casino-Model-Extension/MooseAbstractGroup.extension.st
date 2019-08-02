Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNAction [
	
	<navigation: 'BL Actions'>
	^ self allWithType: CSNAction
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNActionAppel [
	<navigation: #CSNActionAppel>
	^ self allWithType: CSNActionAppel 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNAttributes [
	<navigation: 'BL Attributes'>
	^ self allWithType: CSNAttribute
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNCell [
	<navigation: 'BL Cell'>
	^ self allWithType: CSNLCell 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNLayout [
	<navigation: 'Sub-Layout'>
	^ self allWithType: CSNLLayout
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
	^ self allWithType: CSNServiceAPI
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNUiContainer [
	
	<navigation: 'BL UiContainer'>
	^ self allWithType: CSNContainer 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidget [
	<navigation: 'Sub-Widget'>
	^ self allWithType: CSNWidget
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidgetExceptPage [
	<navigation: 'Sub-Widget ExceptPage'>
	^ (self allWithType: CSNWidget)
		reject: [ :el | (el isKindOf: CSNPage) or: [ el isKindOf: CSNBusinessPage ] ]
]
