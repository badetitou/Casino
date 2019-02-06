Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLAction [
	
	<navigation: 'BL Actions'>
	^ self allWithSubTypesOf: CSNAction
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLActionAppel [
	<navigation: #CSNActionAppel>
	^ self allWithSubTypesOf: CSNActionAppel 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLAttributes [
	<navigation: 'BL Attributes'>
	^ self allWithSubTypesOf: CSNAttribute
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLCell [
	<navigation: 'BL Cell'>
	^ self allWithType: CSNCell 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLLayout [
	<navigation: 'Sub-Layout'>
	^ self allWithSubTypesOf: CSNLayout
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLPage [
	<
	navigation:
		'BL Page'>
	^ self
		allWithType:
			CSNPage
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLPageMetier [
	<navigation: 'BL Page Metier'>
	^ self allWithType: CSNBusinessPage 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLService [
	<navigation: 'BL Service'>
	^ self allWithType: CSNService 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLServiceAPI [
	<navigation: #CSNServiceAPI>
	^ self allWithSubTypesOf: CSNServiceAPI
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLUiContainer [
	
	<navigation: 'BL UiContainer'>
	^ self allWithType: CSNUIContainer 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLWidget [
	<navigation: 'Sub-Widget'>
	^ self allWithSubTypesOf: CSNWidget
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allBLWidgetExceptPage [
	<navigation: 'Sub-Widget ExceptPage'>
	^ (self allWithSubTypesOf: CSNWidget)
		reject: [ :el | (el isKindOf: CSNPage) or: [ el isKindOf: CSNBusinessPage ] ]
]
