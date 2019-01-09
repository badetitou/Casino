Extension { #name : #MooseAbstractGroup }

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLAction [
	
	<navigation: 'BL Actions'>
	^ self allWithSubTypesOf: BLAction
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLActionAppel [
	<navigation: 'BLActionAppel'>
	^ self allWithSubTypesOf: BLActionAppel 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLAttributes [
	<navigation: 'BL Attributes'>
	^ self allWithSubTypesOf: BLAttribute
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLCell [
	<navigation: 'BL Cell'>
	^ self allWithType: BLCell 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLLayout [
	<navigation: 'Sub-Layout'>
	^ self allWithSubTypesOf: BLLayout
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLPage [
	<
	navigation:
		'BL Page'>
	^ self
		allWithType:
			BLPage
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLPageMetier [
	<navigation: 'BL Page Metier'>
	^ self allWithType: BLBusinessPage 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLService [
	<navigation: 'BL Service'>
	^ self allWithType: BLService 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLServiceAPI [
	<navigation: 'BLServiceAPI'>
	^ self allWithSubTypesOf: BLServiceAPI
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLUiContainer [
	
	<navigation: 'BL UiContainer'>
	^ self allWithType: BLUIContainer 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLWidget [
	<navigation: 'Sub-Widget'>
	^ self allWithSubTypesOf: BLWidget
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLWidgetExceptPage [
	<navigation: 'Sub-Widget ExceptPage'>
	^ (self allWithSubTypesOf: BLWidget)
		reject: [ :el | (el isKindOf: BLPage) or: [ el isKindOf: BLBusinessPage ] ]
]
